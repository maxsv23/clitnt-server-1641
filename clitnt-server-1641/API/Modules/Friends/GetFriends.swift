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

import Foundation
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

    /// если не обьявить функцию (urladdQueryParams класса UrlBuilderRequest) как static - class тогда нужно создвать экземплякр класса UrlBuilderRequest()

    func getModel () {

        var modelResult:ModelFriends?
        
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }

        JsonDecoding.fetch(moduleDecod: ModelFriends.self, url: url) { data in

            modelResult = data as? ModelFriends

            print(modelResult?.response.items as Any)
        }

    }

}

