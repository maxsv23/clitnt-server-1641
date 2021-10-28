//
//  GetRequest.swift
//  clitnt-server-1641
//
//  Created by maxim on 27.10.2021.
//

import Foundation

class GetJson {

   
   // class func (сюда прилетает данные) {
    // вызов функции для получения урл
    // далее вызываем получение данных
    //  далее парсим данные
    //  возвращаем
    //
    //
    //
//
//}
    
    
    
    
    
    
    class func getRequest(url: URL, completion: @escaping (String?, Error?) -> Void) {

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request){
            (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {return}

            let jsonString = String(data: data, encoding: .utf8)
///загоняем в МАЙН поток чтобы данные обработались корректно
            DispatchQueue.main.async {
                completion(jsonString, error)
            }
        }
        task.resume()

    }
}
