//
//  MandrillErrorResponse.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MandrillErrorResponse {
    
    let status: String
    let code: Int
    let name: String
    let message: String
    
    init(status: String, code: Int, name: String, message: String) {
        self.status = status
        self.code = code
        self.name = name
        self.message = message
    }
    
    init(json: JSON) {
        self.status = json["status"].stringValue
        self.code = json["code"].intValue
        self.name = json["name"].stringValue
        self.message = json["message"].stringValue
    }
}
