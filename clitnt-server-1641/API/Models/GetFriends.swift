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
    var params: [String: String]


    init(){
        // enum rawValue получаем значение по enum
        self.path = EnumHost.Urlmodule.friends.rawValue
        self.host = EnumHost.BaseURL.api.rawValue

        self.params = [
            "order": "name",
            "fields" : "nickname",
            "count": "3",
            "v" : "5.81"
        ]
    }

    /// если не обьявить функцию (urladdQueryParams класса UrlBuilderRequest) как static - class тогда нужно создвать экземплякр класса UrlBuilderRequest()

    func jsonString () {
        
      
        
        
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }

        print(url)
        
        
        GetJson.fetch(url: url) { json in
           // var  array = json as! [Any]
            DispatchQueue.main.async {
                //теперь делается в потоке main
              //  let array = json as! [Any]

                //print(json)
               
            }
        }

    }
    
}
