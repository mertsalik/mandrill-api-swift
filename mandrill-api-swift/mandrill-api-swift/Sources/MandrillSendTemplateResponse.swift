//
//  MandrillSendTemplateResponse.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON


struct MandrillSendTemplateResponse : MandrillModel{
    let email: String
    let status: String
    let _id: String
    let reject_reason: String?
    
    init(json: JSON){
        self.email = json["email"].stringValue
        self.status = json["status"].stringValue
        self._id = json["_id"].stringValue
        self.reject_reason = json["reject_reason"].string
    }
    
    func toJSON() -> Dictionary<String, AnyObject> {
        return [
            "email": self.email as AnyObject,
            "status": self.status as AnyObject,
            "_id": self._id as AnyObject,
            "reject_reason": self.reject_reason as AnyObject
        ]
    }
}
