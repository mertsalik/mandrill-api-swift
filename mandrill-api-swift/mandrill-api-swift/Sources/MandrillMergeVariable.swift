//
//  MandrillMergeVariable.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

/// a single merge variable
struct MandrillMergeVariable: MandrillModel{
    
    /// the merge variable's name. Merge variable names are case-insensitive and may not start with _
    let name: String
    
    /// the merge variable's content
    let content: String
    
    init(name: String, content: String) {
        self.name = name
        self.content = content
    }
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.content = json["content"].stringValue
    }
}

extension MandrillMergeVariable{
    
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "name": self.name as AnyObject,
            "content": self.content as AnyObject
        ]
    }
}
