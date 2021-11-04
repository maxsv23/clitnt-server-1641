
//    Item.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport
//фишки xcode
//Быстрое перемещение по файлу CTRL + 6
// удаление пустых строк регулярное выражение (      )
//opt+cmd+ []  движение блока вверх вниз
//cmd + -  увеличить уменьшить код
//переименование переменной класса итд во всем коде  ПР. клавиша -> Refactor -> rename
//Быстрый поиск cmd shift + o
//снипиты
// переименовать в БЛОКЕ выделить слово - cmd + ctrl + e
// коментарий для встроеной справки нажать на строку CMD + opt + /    тоже самое можно сделать
/// три слеша это дескрипшен будет  в строке ниже будет описание параметров

import Foundation
import RealmSwift

class RealmSwiftFriends : Object,Codable {
    
    ////    @objc dynamic var firstName : String = String()
    //    @objc dynamic var id : Int = Int()
    ////    @objc dynamic var lastName : String = String()
    ////    @objc dynamic var nickname : String = String()
    //    @objc dynamic var photo50 : String = String()
    ////    @objc dynamic var trackCode : String = String()
    //
    //
    //    enum CodingKeys: String, CodingKey {
    ////        case firstName = "first_name"
    //        case id = "id"
    ////        case lastName = "last_name"
    ////        case nickname = "nickname"
    //        case photo50 = "photo_50"
    ////        case trackCode = "track_code"
    //    }
    
    @objc dynamic var id: Int = 0
    @objc dynamic var photo50: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case photo50 = "photo_50"
    }
    
//    convenience required init(from decoder: Decoder)throws {
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
//        
//        photo50 = try values.decodeIfPresent(String.self, forKey: .photo50) ?? "nil"
//        
//        self.init()
//        
//    }
    
    //    override static func primaryKey() -> String? { //you need this in case you will want to update this object in Realm
    //        return "id"
    //    }
    
}
