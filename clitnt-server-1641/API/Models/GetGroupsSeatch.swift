//
//  GetGroupsSeatch.swift
//  clitnt-server-1641
//
//  Created by maxim on 28.10.2021.
//

import Foundation

class GetGroupsSeatch {
    
    let host:String
    let path:String
    let params: [String: String]
    let userID:String
    let token:String
    
    init(){
        // enum rawValue получаем значение по enum
        self.host = EnumHost.BaseURL.api.rawValue
        self.path = EnumHost.Urlmodule.groupsSearch.rawValue
       
        self.token = Session.shared.token
        self.userID = Session.shared.userID
        self.params = [
            "user_id" : userID,
            "access_token":token,
            "q": "Music",
            "count" : "3",
            "offset": "3",
            "v" : "5.81"
        ]
    }
    
    func getUrlForFriendsAPI() -> URL? {
        
        let urlAbsolute = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params)
        
        return urlAbsolute
    }
    
    func jsonString () {
        guard let urlAbsolute = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        GetRequest.getRequest(url: urlAbsolute){ (json, error) in
            
//            guard let json = json else {return}
//            guard let error = error else {return}
            print(json)
            print(error)
        }
    }
     
}

