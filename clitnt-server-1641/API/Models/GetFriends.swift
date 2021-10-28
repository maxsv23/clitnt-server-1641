//фишки xcode
//Быстрое перемещение по файлу CTRL + 6
// удаление пустых строк регулярное выражение (   ^\s+$   )
//opt+cmd+ []  движение блока вверх вниз
//cmd + -  увеличить уменьшить код
//переименование переменной класса итд во всем коде  ПР. клавиша -> Refactor -> rename
//Быстрый поиск cmd shift + o
//снипиты
// переименовать в БЛОКЕ выделить слово - cmd + ctrl + e
// коментарий для встроеной справки нажать на строку CMD + opt + /    тоже самое можно сделать
/// три слеша это дескрипшен будет  в строке ниже будет описание параметров

import Foundation

class GetFriends {
    
    let host:String
    let path:String
    let params: [String: String]
    let userID:String
    let token:String
    
    init(){
        // enum rawValue получаем значение по enum
        self.path = EnumHost.Urlmodule.friends.rawValue
        self.host = EnumHost.BaseURL.api.rawValue
        self.token = Session.shared.token
        self.userID = Session.shared.userID
        self.params = [
            "user_id" : userID,
            "order": "name",
            "fields" : "nickname",
            "count": "3",
            "access_token" : token,
            "v" : "5.81"
        ]
    }
    
    /// если не обьявить функцию (urladdQueryParams класса UrlBuilderRequest) как static - class тогда нужно создвать экземплякр класса UrlBuilderRequest()
    /// так и не смог заставить работать как static - class
    
    func getUrlForFriendsAPI() -> URL? {
        
        let urlAbsolute = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params)
        
        return urlAbsolute
        ///  знак вопроса это отложенный вызов
        /// ВЫЗОВ таких функций fff?(222)
        ///     func ff (_ number: Int) -> () {    }
        /// тоже самое что и
        ///var fff: ((_ number: Int) -> ())?
    }
    
    func jsonString () {
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        GetJson.getRequest(url: url){ (json, error) in
            
//            guard let json = json else {
//                return
//            }
//            guard let error = error else {
//                return
//            }
            print(json)
            print(error)
        }
    }
}
