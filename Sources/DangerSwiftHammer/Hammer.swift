//
//  Hammer.swift
//
//
//  Created by 史 翔新 on 2020/07/11.
//

@available(*, deprecated, message: "This protocol is not intended to be used on user-side. Just use provided `danger.hammer.xxx` methods.")
public protocol DangerDSLCompatible {
    var baseBranch: String { get }
    func execShellCommand(_ command: String) -> String
}

public struct Hammer {
    
    let baseBranchResolver: () -> String
    let shellCommandExecutor: (String) -> String
    
}

// MARK: - Public Properties and Methods

extension Hammer {
    
    public func diffPatch(for filename: String) -> String {
        
        let command = diffCommand(parsingFile: filename)
        let diff = shellCommandExecutor(command)
        
        return diff
        
    }
    
    public func diffLines(in filename: String) -> (deletions: [String], additions: [String]) {
        
        let patch = diffPatch(for: filename)
        
        let diff = patch.components(separatedBy: "\n").reduce(into: Diff()) { (diff, line) in
            
            if line.hasPrefix("---") || line.hasPrefix("+++") {
                return
            }
            
            if line.hasPrefix("-") {
                diff.deletions.append(line)
                
            } else if line.hasPrefix("+") {
                diff.additions.append(line)
            }
            
        }
        
        return (diff.deletions, diff.additions)
        
    }
    
}

// MARK: - Internal Properties and Methods

extension Hammer {
    
    func diffCommand(parsingFile: String) -> String {
        
        return #"git diff origin/\#(baseBranchResolver()) -- "\#(parsingFile)""#
        
    }
    
}

// MARK: - Private Types

private struct Diff {
    var deletions: [String] = []
    var additions: [String] = []
}
