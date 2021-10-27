//
//  GetRequest.swift
//  clitnt-server-1641
//
//  Created by maxim on 27.10.2021.
//

import Foundation

class GetRequest {
    
    /// передаем подготовленный URL
    /// ждем клоужер-замыкание  (ждем пока не обработается есть маркер @escaping)
    
    /// 10000 раз напомнил значит запомнил )))) Void этот тот же () разницы абсалютно нет можно проверить в справке
    ///

    
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
          
          guard let data = data else {
              return
          }
          
//          
//          do {
//              let json = try JSONSerialization.jsonObject(with: data, options: [])
//              print(json)
//          } catch {
//              print(error.localizedDescription)
//          }
//          
//          
//
//
        let jsonString = String(data: data, encoding: .utf8)
          
          DispatchQueue.main.async {
              completion(jsonString, error)
          }

          
          
          

          
      }
      
      task.resume()
      
        }
}
