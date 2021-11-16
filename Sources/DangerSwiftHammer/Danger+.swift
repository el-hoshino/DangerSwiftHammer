//
//  Danger+.swift
//  
//
//  Created by 史 翔新 on 2020/07/11.
//

import Danger

@available(*, deprecated)
extension DangerDSL: DangerDSLCompatible {
    
    public var baseBranch: String {
        
        github.pullRequest.base.ref
        
    }
    
    public func execShellCommand(_ command: String) -> String {
                
        return utils.exec(command)
        
    }
    
}

extension DangerDSL {
    
    public var hammer: Hammer {
        
        return .init(baseBranchResolver: { github.pullRequest.base.ref },
                     shellCommandExecutor: { utils.exec($0) })
        
    }
    
}
