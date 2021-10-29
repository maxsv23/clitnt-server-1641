//
//  GetRequest.swift
//  clitnt-server-1641
//
//  Created by maxim on 27.10.2021.
//

import Foundation

class GetJson {
    
    class func fetch(url: URL,completion: @escaping (Any) -> ()){
        
        
        
        
        
        let task = URLSession.shared.dataTask(with: url){ (data, response , error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            
            guard  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return}

            completion(json)
            
            
            
        }
        task.resume()
    }
    
}
