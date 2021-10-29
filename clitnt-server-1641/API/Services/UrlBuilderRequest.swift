//фишки xcode
//Быстрое перемещение по файлу CTRL + 6
// удаление пустых строк регулярное выражение (   ^\s+$   )
//opt+cmd+ []  движение блока вверх вниз
//cmd + -  увеличить уменьшить код
//переименование переменной класса итд во всем коде  ПР. клавиша -> Refactor -> rename
//Быстрый поиск cmd shift + o
//снипиты
// переименовать в БЛОКЕ выделить слово - cmd + ctrl + e
// коментарий для встроеной справки нажать на строку CMD + opt + /    тоже самое можно сделать /// три слеша это дескрипшен будет  в строке ниже /// будет описание параметров

import Foundation

class UrlBuilderRequest {
    
    /// [String:String] = [:] для избежания пустого  arrey можно  применить а можно и не можно
    /// static class и так и так доступно из вне
    /// ради практики будем использовать замыкания для обращения к функции
    ///  можно делегат но это потом
    
    
    
    class func urlBuilderRequest(host:String, path:String, params : [String:String]) -> URL? {
        
        let userID = Session.shared.userID
        let token = Session.shared.token
       
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = host
        components.path = path
             
        components.setQueryItems(with: params )
        
        //добавим токен и id
        components.queryItems?.append(URLQueryItem(name: "access_token", value: token))
        components.queryItems?.append(URLQueryItem(name: "user_id", value: userID))

        
        
        
        
        return components.url
     
        
    }
    
}
