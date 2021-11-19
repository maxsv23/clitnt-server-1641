
//
//    ModelFriends.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class FriendsRealmSwiftModel : Codable {

   // @objc dynamic
  //  var installStart: Int = Int()
    var response: FriendsResponse? = FriendsResponse()

//
//    enum CodingKeys: String, CodingKey {
//        case response
//   //     case installStart
//    }
//    convenience required init(from decoder: Decoder) throws {
//        self.init()
//
//
//       let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        response = try values.decodeIfPresent(FriendsResponse.self, forKey: .response)!
//      //  installStart = try values.decodeIfPresent(Int.self, forKey: .installStart) ?? 0
//        //response = try FriendsResponse(from: decoder)
//    }
//    ///Что бы не создавать пустую таблицу в базе
//    override class func shouldIncludeInDefaultSchema() -> Bool {
//       return false
//    }
    
}




