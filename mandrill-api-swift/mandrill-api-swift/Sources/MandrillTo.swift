//
//  MandrillTo.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

/// a single recipient's information.
struct MandrillTo: MandrillModel{
    
    /// the email address of the recipient
    /// required
    let email: String
    
    /// the optional display name to use for the recipient
    let name: String
    
    /// the header type to use for the recipient, defaults to "to" if not provided
    /// oneof(to, cc, bcc)
    let type: String
    
    init(email: String, name: String, type: String) {
        self.email = email
        self.name = name
        self.type = type
    }
    
    init(json: JSON) {
        self.email = json["email"].stringValue
        self.name = json["name"].stringValue
        self.type = json["type"].stringValue
    }
}


extension MandrillTo{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "email": self.email as AnyObject,
            "name": self.name as AnyObject,
            "type": self.type as AnyObject
        ]
    }
}
