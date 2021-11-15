//
//  Danger+.swift
//  
//
//  Created by 史 翔新 on 2020/07/11.
//

import Danger

extension DangerDSL: DangerDSLCompatible {
    
    public var hammer: Hammer<DangerDSL> {
        
        return Hammer(danger: self)
        
    }
    
    public var baseBranch: String {
        
        github.pullRequest.base.ref
        
    }
    
    public func execShellCommand(_ command: String) -> String {
                
        return utils.exec(command)
        
    }
    
}
