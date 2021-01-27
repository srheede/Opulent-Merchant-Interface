//
//  Shop.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 1/27/21.
//

import Cocoa

struct Shop: Codable {
    var shopID: String
    
    var dictionary: [String: Any] {
        return ["shopID": shopID]
    }
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
