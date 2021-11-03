//
//  RealmSwiftFriends.swift
//  clitnt-server-1641
//
//  Created by maxim on 01.11.2021.
//

import Foundation
import RealmSwift

class RealmSwiftFriends: Object, Codable {
    
    @objc dynamic var id = 0
    @objc dynamic var photo50 = ""
    
    
    
    
       override static func primaryKey() -> String? { //you need this in case you will want to update this object in Realm
          return "id"
       }


}

