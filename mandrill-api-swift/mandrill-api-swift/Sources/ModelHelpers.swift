//
//  ModelHelpers.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import SwiftyJSON

func parseModel<T>(_ json: JSON) -> T where T:MandrillModel {
    return T(json: json)
}

func parseModels<T>(_ json: JSON) -> [T] where T:MandrillModel {
    var list = [T]()
    switch json.type {
    case .array:
        for itemDictionary in json.array! {
            let item = T(json: itemDictionary)
            list.append(item)
        }
    case .dictionary:
        list.append(T(json: json))
    default: break
    }
    
    return list
}
