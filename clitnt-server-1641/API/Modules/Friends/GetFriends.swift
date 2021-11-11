//фишки xcode
//Быстрое перемещение по файлу CTRL + 6
// удаление пустых строк регулярное выражение (   ^\s+$   )
//opt+cmd+ []  движение блока вверх вниз
//cmd + -  увеличить уменьшить код
//переименование переменной класса итд во всем коде  ПР. клавиша -> Refactor -> rename
//Быстрый поиск cmd + shift + o
//снипиты
// переименовать в БЛОКЕ выделить слово - cmd + ctrl + e
// коментарий для встроеной справки нажать на строку CMD + opt + /    тоже самое можно сделать
/// три слеша это дескрипшен будет  в строке ниже будет описание параметров
///
///  DispatchQueue.main.async {
///теперь делается в потоке main
///    }
//  /// MARK: - IBOUtlets

//  // MARK: - Public Properties

//  // MARK: - Private Properties

//  // MARK: - Lifecycle

//   // MARK: - Public Methods

//  // MARK: - Private Methods

//   // MARK: - IBActions

import Foundation
import RealmSwift
import SwiftUI

class GetFriends {

    let host:String
    let path:String
    var params: [String: String]

    init(){
        // enum rawValue получаем значение по enum
        self.path = EnumHost.Urlmodule.friends.rawValue
        self.host = EnumHost.BaseURL.api.rawValue

        self.params = [
            "order": "name",
            "fields" : "nickname,photo_50",
            "count": "3",
            "v" : "5.81"
        ]
    }

    func setDataFromSiteToRealmswiftDB (){

        //формируем корректный со всеми параметрами запрос на сервер
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        // обработка запроса с занесение в базу данных
        JsonDecodingToRealmDB().fetch(FriendsRealmSwiftModel.self,url)

    }

    func getDataFromRealmDB () {

        do{
            // let response = try JSONDecoder().decode(FriendsRealmSwiftModel.self, from: data!)

            // хорошо что посмотрел урок следи за версией базы!!!
            let verRealm = Realm.Configuration(schemaVersion:25)
            let realm = try Realm(configuration: verRealm)

            //тут массив Френдсов
            let tested = realm.objects(FriendsItem.self)

            //print(tested)
             tested.forEach{print($0.firstName, $0.id)}
        }catch {
            print("щшибка")
            print(error)
        }
    }

    /// если не обьявить функцию (urladdQueryParams класса UrlBuilderRequest) как static - class тогда нужно создвать экземплякр класса UrlBuilderRequest()
    ///создавалась для обучения работы со структурами и декодированием json

    //    func getModel () {
    //       // var modelResult:RealmSwiftFriends
    //        //формируем корректный со всеми параметрами запрос на сервер
    //        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
    //        /// через замыкание отправляем тип структуры-модели данных URL  нам приходит модель
    //        /// сделано для практики применения замыкания и работы с различными типами данных
    //        JsonDecoding.fetch(moduleDecod: RealmSwiftFriends.self, url: url) { data in
    //           // modelResult = data as? ModelFriends
    //            print(data as Any)
    //        }
    //    }

}
