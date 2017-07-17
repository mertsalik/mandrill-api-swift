//
//  MandrillMergeVariables.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

/// per-recipient merge variables
struct MandrillMergeVariables: MandrillModel{
    
    /// the email address of the recipient that the merge variables should apply to
    /// required
    let rcpt: String
    
    /// the recipient's merge variables
    let vars: [MandrillMergeVariable]
    
    init(rcpt: String, vars: [MandrillMergeVariable]) {
        self.rcpt = rcpt
        self.vars = vars
    }
    
    init(json: JSON) {
        self.rcpt = json["rcpt"].stringValue
        self.vars = parseModels(json["vars"] as JSON)
    }
}

extension MandrillMergeVariables{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "rcpt": self.rcpt as AnyObject,
            "vars": self.vars as AnyObject
        ]
    }
}
