//
//  MandrillSendTemplate.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//


import Foundation
import SwiftyJSON

/// Send a new transactional message through Mandrill using a template
/// Errors:
///     * Unknown_Template -> The requested template does not exist
///     * PaymentRequired -> The requested feature requires payment.
///     * Invalid_Key -> The provided API key is not a valid Mandrill API key
///     * Unknown_Subaccount -> The provided subaccount id does not exist.
/// 	* ValidationError -> The parameters passed to the API call are invalid or not provided when required
///     * GeneralError -> An unexpected error occurred processing the request. Mandrill developers will be notified.

struct SendTemplateMessage: MandrillModel {
    
    /// a valid API key
    let key: String
    
    /// the immutable name or slug of a template that exists in the user's account.
    /// For backwards-compatibility, the template name may also be used but the immutable slug is preferred.
    /// Validation: required
    let template_name : String
    
    /// an array of template content to send. Each item in the array should be
    /// a struct with two keys - name: the name of the content block to set the content for,
    /// and content: the actual content to put into the block
    let template_content : [MandrillTemplateContent]
    
    /// the other information on the message to send - same as /messages/send, but without the html content
    let message: MandrillMessage
    
    /// enable a background sending mode that is optimized for bulk sending.
    /// In async mode, messages/send will immediately return a status of "queued" for every recipient.
    /// To handle rejections when sending in async mode, set up a webhook for the 'reject' event.
    /// Defaults to false for messages with no more than 10 recipients;
    /// messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
    let async: Bool?
    
    /// the name of the dedicated ip pool that should be used to send the message.
    /// If you do not have any dedicated IPs, this parameter has no effect.
    /// If you specify a pool that does not exist, your default pool will be used instead.
    let ip_pool: String?
    
    /// when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format.
    /// If you specify a time in the past, the message will be sent immediately.
    /// An additional fee applies for scheduled email, and this feature is only available to accounts with a positive balance.
    /// Validation: datetime
    let send_at: String?
    
    init(key: String, template_name: String, template_content: [MandrillTemplateContent],
         message: MandrillMessage, async: Bool?, ip_pool: String?, send_at: String?) {
        self.key = key
        self.template_name = template_name
        self.template_content = template_content
        self.message = message
        self.async = async
        self.ip_pool = ip_pool
        self.send_at = send_at
    }
    
    init(json: JSON) {
        self.key = json["key"].stringValue
        self.template_name = json["template_name"].stringValue
        self.template_content = parseModels(json["template_content"]) as [MandrillTemplateContent]
        self.message = parseModel(json["message"])
        self.async = json["async"].bool
        self.ip_pool = json["ip_pool"].string
        self.send_at = json["send_at"].string
    }
}

extension SendTemplateMessage{
    
    func toJSON() -> Dictionary<String, AnyObject>{
        return [
            "key": self.key as AnyObject,
            "template_name": self.template_name as AnyObject,
            "template_content": self.template_content.toJSON() as AnyObject,
            "message": self.message.toJSON() as AnyObject,
            "async": self.async as AnyObject,
            "ip_pool": self.ip_pool as AnyObject,
            "send_at": self.send_at as AnyObject
        ]
    }
}
