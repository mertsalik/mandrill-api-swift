//
//  MandrillAttachment.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//


import Foundation
import SwiftyJSON

/// a single supported attachment
struct MandrillAttachment: MandrillModel {
    
    /// the MIME type of the attachment
    let type: String
    
    /// the file name of the attachment
    let name: String
    
    /// the content of the attachment as a base64-encoded string
    let content: String
    
    init(type: String, name: String, content: String) {
        self.type = type
        self.name = name
        self.content = content
    }
    
    init(json: JSON) {
        self.type = json["type"].stringValue
        self.name = json["name"].stringValue
        self.content = json["content"].stringValue
    }
}

extension MandrillAttachment{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "type": self.type as AnyObject,
            "name": self.name as AnyObject,
            "content": self.content as AnyObject
        ]
    }
}
