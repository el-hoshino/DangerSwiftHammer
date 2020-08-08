//
//  DangerSwiftHammer.swift
//
//
//  Created by 史 翔新 on 2020/07/11.
//

public protocol DangerData {
    var baseBranch: String { get }
    func execShellCommand(_ command: String) -> String
}

public struct DangerSwiftHammer<Danger: DangerData> {
    
    private let danger: Danger
    
    init(danger: Danger) {
        self.danger = danger
    }
    
}

// MARK: - Public Properties and Methods

extension DangerSwiftHammer {
    
    public func diffPatch(for filename: String) -> String {
        
        let command = diffCommand(parsingFile: filename)
        let diff = danger.execShellCommand(command)
        
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

extension DangerSwiftHammer {
    
    func diffCommand(parsingFile: String) -> String {
        
        return #"git diff origin/\#(danger.baseBranch) -- "\#(parsingFile)""#
        
    }
    
}

// MARK: - Private Types

private struct Diff {
    var deletions: [String] = []
    var additions: [String] = []
}
