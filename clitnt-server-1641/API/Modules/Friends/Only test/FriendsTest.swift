//
//  FriendsTest.swift
//  clitnt-server-1641
//
//  Created by Максим Воеводин on 04.11.2021.
//

import Foundation
import RealmSwift

class FriendsTest {
    
    func zxc () {
        
        let json = """
{
  "response": {
    "count": 3,
    "items": [
      {
        "first_name": "Вячеслав111",
        "id": 199892791,
        "last_name": "Назаретский",
        "photo_50": "https://sun9-38.userapi.com/s/v1/if1/pI7hrWaGz8XuNJ0JiWQl2c8dlJl288ka0A7EAAOGSro2qZX60Y-24cfVX0ZNm16xTmHVxRfO.jpg?size=50x50&quality=96&crop=130,675,1322,1322&ava=1",
        "nickname": "",
        "track_code": "8eeaaad37ymdb3FsQGU1a1kuYJWhkhNMKVe9Eqj0FBQnnj8WOM-CQsMNTT4cajswa__gRy34YFgwW6p8zA"
      },
      {
        "first_name": "Оксана",
        "id": 6491818,
        "last_name": "Шарыгина",
        "photo_50": "https://sun9-61.userapi.com/s/v1/if1/py8IdPS3dkl4Aj8_FAntQEoRTJUxONlSDPLpJFI1xanEe-Tzxm8Y-WHi7TIbqAGZ_N5I9qQz.jpg?size=50x50&quality=96&crop=249,4,640,640&ava=1",
        "nickname": "",
        "track_code": "5e7af7cfs61tkO41gMkJkcvokcgGyWKuU9995RYMdJMwCnmjoWzexjKo3DXXx16Y-zYuRu28G61Tthg"
      },
      {
        "first_name": "Ольга",
        "id": 55379673,
        "last_name": "Савина",
        "photo_50": "https://sun9-13.userapi.com/s/v1/ig2/vcDnrVGczHFFBTMzQoUdbbLbgQeDBcI6trgHJ9AaBvyVPsZqyTZhVYBYF5CkOZtAOHku0reFdOCYOmV2Eim1dm2-.jpg?size=50x50&quality=96&crop=100,492,573,573&ava=1",
        "nickname": "",
        "track_code": "01473902xhMg6cS4XxJ7Yo3flix-McOaenNUnDwtDdTMkD0YvDireH_eqOteGHptuQ4cyZlXo5dtaDHy"
      }
    ]
  }
}
""".data(using: .utf8)!
        
        do {
            
            //   print("111111")
            //  let array = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! Dictionary<String, [AnyObject]>
            // print(array["users"]![1]["id"]! as! Int)
            //   print(array["users"]![0])
            // let user = try JSONDecoder().decode(PlanUser.self, from: array["users"]![0] as! Data)// as! Dictionary<String, [Any]>

            let response = try JSONDecoder().decode(FriendsRealmSwiftModel.self, from: json)
            let verRealm = Realm.Configuration(schemaVersion:24)
            let realm = try Realm(configuration: verRealm)
            realm.beginWrite()
            let result = response.response!.items as List<FriendsItem>
            realm.add(result, update: .all)
            try realm.commitWrite()
            print(realm.configuration.fileURL ?? "")
            
        } catch {
            print(error)
        }
  
    }
    
}



