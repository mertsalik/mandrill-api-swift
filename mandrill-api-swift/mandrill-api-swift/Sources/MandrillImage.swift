//
//  MandrillImage.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON


/// a single embedded image
struct MandrillImage: MandrillModel {
    
    // the MIME type of the image - must start with "image/"
    let type: String
    
    // the Content ID of the image - use <img src="cid:THIS_VALUE"> to reference the image in your HTML content
    let name: String
    
    // the content of the image as a base64-encoded string
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

extension MandrillImage{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "type": self.type as AnyObject,
            "name": self.name as AnyObject,
            "content": self.content as AnyObject
        ]
    }
}
