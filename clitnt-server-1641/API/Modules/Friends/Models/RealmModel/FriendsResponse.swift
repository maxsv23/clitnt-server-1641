//
//    ModelResponse.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class FriendsResponse : Object,Codable {

// если надо будет в базу сохранять этот обьект пишем как ниже
//    @objc dynamic var count : Int = Int()
//    dynamic var items  = List<FriendsItem>()
    
    //пишем если не надо сохранять обьект
        var count : Int = Int()
        var items  = List<FriendsItem>()

    
    
    // эта магия с энумами и ниже если нам важно приходящие имена ассоциировать с нашими
    // пример прихрдит id а мы хотим чтобы записывалось IDName
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
