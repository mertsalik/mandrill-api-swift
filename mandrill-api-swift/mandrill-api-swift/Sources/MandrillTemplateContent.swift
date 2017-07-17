//
//  MandrillTemplateContent.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

/// the injection of a single piece of content into a single editable region
struct MandrillTemplateContent: MandrillModel{
    
    /// the name of the mc:edit editable region to inject into required
    let name: String
    
    /// the content to inject required
    let content : String
    
    init(name: String, content: String) {
        self.name = name
        self.content = content
    }
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.content = json["content"].stringValue
    }
}


extension MandrillTemplateContent{
    
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "name": self.name as AnyObject,
            "content": self.content as AnyObject
        ]
    }
}
