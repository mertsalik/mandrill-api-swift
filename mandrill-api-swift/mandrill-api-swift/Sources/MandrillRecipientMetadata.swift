//
//  MandrillRecipientMetadata.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//


import Foundation
import SwiftyJSON

/// metadata for a single recipient
struct MandrillRecipientMetadata: MandrillModel {
    
    /// the email address of the recipient that the metadata is associated with
    let rcpt: String
    
    /// an associated array containing the recipient's unique metadata.
    /// If a key exists in both the per-recipient metadata and the global metadata,
    /// the per-recipient metadata will be used.
    let values: [String: Any]?
    
    init(rcpt: String, values: [String: Any]) {
        self.rcpt = rcpt
        self.values = values
    }
    
    init(json: JSON) {
        self.rcpt = json["rcpt"].stringValue
        self.values = json["values"].dictionaryObject
    }
}

extension MandrillRecipientMetadata{
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "rcpt": self.rcpt as AnyObject,
            "values": self.values as AnyObject
        ]
    }
}
