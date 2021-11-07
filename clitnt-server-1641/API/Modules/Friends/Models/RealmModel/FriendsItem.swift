
//
//    ModelItem.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class FriendsItem : Object,Codable {

    @objc dynamic var firstName : String = String()
    @objc dynamic var id : Int = Int()
    @objc dynamic var lastName : String = String()
    @objc dynamic var nickname : String = String()
    @objc dynamic var photo50 : String = String()
    @objc dynamic var trackCode : String = String()


    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case nickname = "nickname"
        case photo50 = "photo_50"
        case trackCode = "track_code"
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname) ?? ""
        photo50 = try values.decodeIfPresent(String.self, forKey: .photo50) ?? ""
        trackCode = try values.decodeIfPresent(String.self, forKey: .trackCode) ?? ""
    }

    // ниже если есть id запись не добавит удобно но внутри данные не проверит
    override static func primaryKey() -> String? {
            return "id"
        }

}
