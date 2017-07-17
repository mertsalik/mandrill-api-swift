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

extension Array where Element: MandrillModel{
    func toJSON() -> [Dictionary<String, AnyObject>]{
        return self.map{ $0.toJSON() }
    }
}

extension JSON {
    // Converts receiver to [String: String], or empty [:] if cannot.
    var stringsDictionaryValue: [String: String] {
        return self.dictionaryValue.mapValues{ $0.stringValue }
    }
}

extension Dictionary {
    // Maps only the values of receiver and returns as a new dictionary.
    // Note: The traditional map function returns an array.
    func mapValues<T>(_ transform: (Value)->T) -> Dictionary<Key,T> {
        var resultDict = [Key: T]()
        for (k, v) in self {
            resultDict[k] = transform(v)
        }
        return resultDict
    }
}
