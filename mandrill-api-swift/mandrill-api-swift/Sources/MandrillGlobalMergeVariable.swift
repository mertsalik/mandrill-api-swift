//
//  MandrillGlobalMergeVariable.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON


/// a single global merge variable
struct MandrillGlobalMergeVariable: MandrillModel{
    
    /// the global merge variable's name. Merge variable names are case-insensitive and may not start with _
    let name: String
    
    /// the global merge variable's content
    let content: Any
    
    init(name: String, content: Any) {
        self.name = name
        self.content = content
    }
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.content = json["content"]
    }
}

extension MandrillGlobalMergeVariable{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "name": self.name as AnyObject,
            "content": self.content as AnyObject
        ]
    }
}
