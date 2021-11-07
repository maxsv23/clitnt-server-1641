//
//    ModelResponse.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class FriendsResponse : Object,Codable {

    @objc dynamic var count : Int = Int()
    dynamic var items  = List<FriendsItem>()


    enum CodingKeys: String, CodingKey {
        case count = "count"
        case items = "items"
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
        items = try values.decodeIfPresent(List<FriendsItem>.self, forKey: .items)!
    }

    ///Что бы не создавать пустую таблицу в базе
    override class func shouldIncludeInDefaultSchema() -> Bool {
       return false
    }
    
}
