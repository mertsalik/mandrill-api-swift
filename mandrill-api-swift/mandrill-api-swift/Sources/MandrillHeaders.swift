//
//  MandrillHeaders.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

/// *** Needs documantation ***
struct MandrillHeaders: MandrillModel{
    
    let Reply_To: String
    
    init(reply_to: String) {
        self.Reply_To = reply_to
    }
    
    init(json: JSON) {
        self.Reply_To = json["Reply_To"].stringValue
    }
}


extension MandrillHeaders{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "Reply_To": self.Reply_To as AnyObject
        ]
    }
}
