//
//  Danger+.swift
//  
//
//  Created by 史 翔新 on 2020/07/11.
//

import Danger

extension DangerDSL: DangerData {
    
    public var hammer: DangerSwiftHammer<DangerDSL> {
        
        return DangerSwiftHammer(danger: self)
        
    }
    
    public func execShellCommand(_ command: String) -> String {
                
        return utils.exec(command)
        
    }
    
}
