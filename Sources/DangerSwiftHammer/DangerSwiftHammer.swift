//
//  DangerSwiftHammer.swift
//
//
//  Created by 史 翔新 on 2020/07/11.
//

public protocol DangerData {
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
    
}

// MARK: - Internal Properties and Methods

extension DangerSwiftHammer {
    
    func diffCommand(parsingFile: String) -> String {
        
        return #"git diff -- "\#(parsingFile)""#
        
    }
    
}
