//
//  GetPhotos.swift
//  clitnt-server-1641
//
//  Created by maxim on 28.10.2021.
//

import Foundation

class GetPhotos {
    
    let host:String
    let path:String
    var params: [String: String]

    
    init(){
        // enum rawValue получаем значение по enum
        self.host = EnumHost.BaseURL.api.rawValue
        self.path = EnumHost.Urlmodule.photos.rawValue
       

        self.params = [
            "extended": "1",
            "owner_id" : "1",
            "count": "3",
            "photo_sizes": "1",
            "no_service_albums": "0",
            "need_hidden": "0",
            "skip_hidden": "1",
            "v" : "5.81"
        ]
    }
    

    func setDataFromSiteToRealmswiftDB (){

        //формируем корректный со всеми параметрами запрос на сервер
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        print(url)
        // обработка запроса с занесение в базу данных
     //   JsonDecodingToRealmDB.fetch(moduleDecod: FriendsRealmSwiftModel.self, url: url)

    }

    func getDataFromRealmDB () {

//        do{
//            // let response = try JSONDecoder().decode(FriendsRealmSwiftModel.self, from: data!)
//
//            // хорошо что посмотрел урок следи за версией базы!!!
//            let verRealm = Realm.Configuration(schemaVersion:25)
//            let realm = try Realm(configuration: verRealm)
//
//            //тут массив Френдсов
//            let tested = realm.objects(FriendsItem.self)
//
//            //print(tested)
//             tested.forEach{print($0.firstName, $0.id)}
//        }catch {
//            print("щшибка")
//            print(error)
//        }
    }
    
}



