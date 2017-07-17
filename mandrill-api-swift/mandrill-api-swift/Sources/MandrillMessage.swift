//
//  MandrillMessage.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//


import Foundation
import SwiftyJSON

/// the information on the message to send
struct MandrillMessage: MandrillModel{
    
    /// the full HTML content to be sent
    let html: String
    
    /// optional full text content to be sent
    let text: String
    
    /// the message subject
    let subject: String
    
    /// the sender email address.
    /// email
    let from_email: String
    
    /// optional from name to be used
    let from_name: String
    
    /// an array of recipient information.
    let mandrillTo: [MandrillTo]
    
    /// optional extra headers to add to the message (most headers are allowed)
    let headers: MandrillHeaders
    
    /// whether or not this message is important, and should be delivered ahead of non-important messages
    let important: Bool
    
    /// whether or not to turn on open tracking for the message
    let track_opens: Bool
    
    /// whether or not to turn on click tracking for the message
    let track_clicks: Bool
    
    /// whether or not to automatically generate a text part for messages that are not given text
    let auto_text: Bool
    
    /// whether or not to automatically generate an HTML part for messages that are not given HTML
    let auto_html: Bool
    
    /// whether or not to automatically inline all CSS styles provided in the message HTML - only for HTML documents less than 256KB in size
    let inline_css: Bool
    
    /// whether or not to strip the query string from URLs when aggregating tracked URL data
    let url_strip_qs: Bool
    
    /// whether or not to expose all recipients in to "To" header for each email
    let preserve_recipients: Bool
    
    /// set to false to remove content logging for sensitive emails
    let view_content_link: Bool
    
    /// an optional address to receive an exact copy of each recipient's email
    /// email
    let bcc_address: String
    
    /// a custom domain to use for tracking opens and clicks instead of mandrillapp.com
    let tracking_domain: String
    
    /// a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients)
    let signing_domain: String
    
    /// a custom domain to use for the messages's return-path
    let return_path_domain: String
    
    /// whether to evaluate merge tags in the message.
    /// Will automatically be set to true if either merge_vars or global_merge_vars are provided.
    let merge: Bool
    
    /// the merge tag language to use when evaluating merge tags, either mailchimp or handlebars
    /// oneof(mailchimp, handlebars)
    let merge_language: String
    
    /// global merge variables to use for all recipients. You can override these per recipient.
    let global_merge_vars: [MandrillGlobalMergeVariable]
    
    /// per-recipient merge variables, which override global merge variables with the same name.
    let merge_vars: [MandrillMergeVariables]
    
    /// an array of string to tag the message with.
    /// Stats are accumulated using tags, though we only store the first 100 we see,
    /// so this should not be unique or change frequently.
    /// Tags should be 50 characters or less.
    /// Any tags starting with an underscore are reserved for internal use and will cause errors.
    let tags: [String]
    
    /// the unique id of a subaccount for this message - must already exist or will fail with an error
    let subaccount: String?
    
    /// an array of strings indicating for which any matching URLs will automatically
    /// have Google Analytics parameters appended to their query string automatically.
    let google_analytics_domains: [String]
    
    /// optional string indicating the value to set for the utm_campaign tracking parameter.
    /// If this isn't provided the email's from address will be used instead.
    let google_analytics_campaign: [String]
    
    /// metadata an associative array of user metadata. Mandrill will store this metadata and make it available for retrieval.
    /// In addition, you can select up to 10 metadata fields to index and make searchable using the Mandrill search api.
    let metadata: [String: String]
    
    /// Per-recipient metadata that will override the global values specified in the metadata parameter.
    let recipient_metadata: [MandrillRecipientMetadata]
    
    /// an array of supported attachments to add to the message
    let attachments: [MandrillAttachment]
    
    /// an array of embedded images to add to the message
    let images: [MandrillImage]
    
    init(html: String, text: String, subject: String, from_email: String,
         from_name: String, mandrillTo: [MandrillTo], headers: MandrillHeaders, important: Bool,
         track_opens: Bool, track_clicks: Bool, auto_text: Bool, auto_html: Bool,
         inline_css: Bool, url_strip_qs: Bool, preserve_recipients: Bool,
         view_content_link: Bool, bcc_address: String, tracking_domain: String,
         signing_domain: String, return_path_domain: String, merge: Bool, merge_language: String,
         global_merge_vars: [MandrillGlobalMergeVariable], merge_vars: [MandrillMergeVariables],
         tags: [String], subaccount: String?, google_analytics_domains: [String],
         google_analytics_campaign: [String], metadata: [String:String],
         recipient_metadatas: [MandrillRecipientMetadata], attachments: [MandrillAttachment],
         images: [MandrillImage] ) {
        self.html = html
        self.text = text
        self.subject = subject
        self.from_email = from_email
        self.from_name = from_name
        self.mandrillTo = mandrillTo
        self.headers = headers
        self.important = important
        self.track_opens = track_opens
        self.track_clicks = track_clicks
        self.auto_text = auto_text
        self.auto_html = auto_html
        self.inline_css = inline_css
        self.url_strip_qs = url_strip_qs
        self.preserve_recipients = preserve_recipients
        self.view_content_link = view_content_link
        self.bcc_address = bcc_address
        self.tracking_domain = tracking_domain
        self.signing_domain = signing_domain
        self.return_path_domain = return_path_domain
        self.merge = merge
        self.merge_language = merge_language
        self.global_merge_vars = global_merge_vars
        self.merge_vars = merge_vars
        self.tags = tags
        self.subaccount = subaccount
        self.google_analytics_domains = google_analytics_domains
        self.google_analytics_campaign = google_analytics_campaign
        self.metadata = metadata
        self.recipient_metadata = recipient_metadatas
        self.attachments = attachments
        self.images = images
    }
    
    init(json: JSON) {
        self.html           = json["html"].stringValue
        self.text           = json["text"].stringValue
        self.subject        = json["subject"].stringValue
        self.from_email     = json["from_email"].stringValue
        self.from_name      = json["from_name"].stringValue
        self.mandrillTo     = parseModels(json["to"] as JSON)
        self.headers        = parseModel(json["headers"] as JSON)
        self.important      = json["important"].boolValue
        self.track_opens    = json["track_opens"].boolValue
        self.track_clicks   = json["track_clicks"].boolValue
        self.auto_text      = json["auto_text"].boolValue
        self.auto_html      = json["auto_html"].boolValue
        self.inline_css     = json["inline_css"].boolValue
        self.url_strip_qs   = json["url_strip_qs"].boolValue
        self.preserve_recipients    = json["preserve_recipients"].boolValue
        self.view_content_link      = json["view_content_link"].boolValue
        self.bcc_address            = json["bcc_address"].stringValue
        self.tracking_domain        = json["tracking_domain"].stringValue
        self.signing_domain         = json["signing_domain"].stringValue
        self.return_path_domain     = json["return_path_domain"].stringValue
        self.merge                  = json["merge"].boolValue
        self.merge_language         = json["merge_language"].stringValue
        self.global_merge_vars      = parseModels(json["global_merge_vars"] as JSON)
        self.merge_vars             = parseModels(json["merge_vars"] as JSON)
        self.tags                   = json["tags"].arrayValue.map({ $0.stringValue })
        self.subaccount             = json["subaccount"].string
        self.google_analytics_domains   = json["google_analytics_domains"].arrayValue.map({ $0.stringValue })
        self.google_analytics_campaign  = json["google_analytics_campaign"].arrayValue.map({ $0.stringValue })
        self.metadata               = json["metadata"].stringsDictionaryValue
        self.recipient_metadata     = parseModels(json["recipient_metadata"] as JSON)
        self.attachments            = parseModels(json["attachments"] as JSON)
        self.images                 = parseModels(json["images"] as JSON)
    }
}

extension MandrillMessage{
    func toJSON() -> Dictionary<String, AnyObject>{
        var result = [String: AnyObject]()
        result["html"] = self.html as AnyObject
        result["text"] = self.text as AnyObject
        result["subject"] = self.subject as AnyObject
        result["from_email"] = self.from_email as AnyObject
        result["from_name"] = self.from_name as AnyObject
        result["to"] = self.mandrillTo.toJSON() as AnyObject
        result["headers"] = self.headers.toJSON() as AnyObject
        result["important"] = self.important as AnyObject
        result["track_opens"] = self.track_opens as AnyObject
        result["track_clicks"] = self.track_clicks as AnyObject
        result["auto_text"] = self.auto_text as AnyObject
        result["auto_html"] = self.auto_html as AnyObject
        result["inline_css"] = self.inline_css as AnyObject
        result["url_strip_qs"] = self.url_strip_qs as AnyObject
        result["preserve_recipients"] = self.preserve_recipients as AnyObject
        result["view_content_link"] = self.view_content_link as AnyObject
        result["bcc_address"] = self.bcc_address as AnyObject
        result["tracking_domain"] = self.tracking_domain as AnyObject
        result["signing_domain"] = self.signing_domain as AnyObject
        result["return_path_domain"] = self.return_path_domain as AnyObject
        result["merge"] = self.merge as AnyObject
        result["merge_language"] = self.merge_language as AnyObject
        result["global_merge_vars"] = self.global_merge_vars.toJSON() as AnyObject
        result["merge_vars"] = self.merge_vars.toJSON() as AnyObject
        result["tags"] = self.tags as AnyObject
        result["subaccount"] = self.subaccount as AnyObject
        result["google_analytics_domains"] = self.google_analytics_domains as AnyObject
        result["google_analytics_campaign"] = self.google_analytics_campaign as AnyObject
        result["metadata"] = self.metadata as AnyObject
        result["recpinient_metadata"] = self.recipient_metadata.toJSON() as AnyObject
        result["attachments"] = self.attachments.toJSON() as AnyObject
        result["images"] = self.images.toJSON() as AnyObject
        return result
    }
}
