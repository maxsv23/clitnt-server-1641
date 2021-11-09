
//
//    ModelFriends.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class FriendsRealmSwiftModel : Object,Codable {

   // @objc dynamic
    @objc dynamic var response : FriendsResponse?


    enum CodingKeys: String, CodingKey {
        case response
    }
//    convenience required init(from decoder: Decoder) throws {
//        self.init()
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        response = try FriendsResponse(from: decoder)
//    }
    ///Что бы не создавать пустую таблицу в базе
    override class func shouldIncludeInDefaultSchema() -> Bool {
       return false
    }
    
}




