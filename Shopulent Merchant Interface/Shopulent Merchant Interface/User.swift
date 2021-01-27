//
//  User.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 1/26/21.
//

import Cocoa

struct User {
    var userID: String
    var shopCount: Int
    var shops: NSDictionary
    
    var dictionary: [String: Any] {
        return ["userID": userID,
                "shopCount": shopCount,
                "shops": shops]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
