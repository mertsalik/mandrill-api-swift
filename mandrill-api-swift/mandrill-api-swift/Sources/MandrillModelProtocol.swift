//
//  MandrillModelProtocol.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol MandrillModel {
    init(json: JSON)
    func toJSON() -> Dictionary<String, AnyObject>
}
