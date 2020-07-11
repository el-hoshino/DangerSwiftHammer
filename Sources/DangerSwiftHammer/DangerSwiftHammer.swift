//
//  DangerSwiftHammer.swift
//
//
//  Created by 史 翔新 on 2020/07/11.
//

public protocol DangerData {
}

public struct DangerSwiftHammer<Danger: DangerData> {
    
    private let danger: Danger
    
    init(danger: Danger) {
        self.danger = danger
    }
    
}

// MARK: - Internal Properties and Methods

extension DangerSwiftHammer {
    
    func diffCommand(parsingFile: String) -> String {
        
        return #"git diff -- "\#(parsingFile)""#
        
    }
    
}
