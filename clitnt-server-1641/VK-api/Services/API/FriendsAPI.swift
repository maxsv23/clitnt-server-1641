//
//  FriendsAPI.swift
//  clitnt-server-1641
//
//  Created by maxim on 25.10.2021.
//

import Foundation
import UIKit

struct Friend {
    
}


final class FrindsAPI {
    
    let baseUrl = "https://api.vk.com/method/users.get?"
    let token = Session.shared.token
    let userID = Session.shared.userID
    let version = "5.131"
    
    func getFriens() {
        
        var resultUrl = baseUrl
        
        let params: [String: Any] = [
            "user_ids" : userID,
            "access_token" : token,
            "fields" : "bdate,photo_50",
            "v" : version
        ]
        
        for (a, b) in params {
            resultUrl = resultUrl + "&" + a + "=" + b
        }
        guard let url = URL(string: resultUrl) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("applicetion/json", forHTTPHeaderField: "Content-Type")
        // request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        // guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        // request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
            
        }.resume()
        
        // let parameters = ["access_token":token, "user_ids": userID,"order":"name","v":version,"fields" : "bdate"]
        
    }
    
}

