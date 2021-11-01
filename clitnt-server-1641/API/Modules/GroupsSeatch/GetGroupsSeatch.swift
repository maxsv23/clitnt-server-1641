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
    var params: [String: String]
    
    init(){
        // enum rawValue получаем значение по enum
        self.host = EnumHost.BaseURL.api.rawValue
        self.path = EnumHost.Urlmodule.groupsSearch.rawValue
        self.params = [
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
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        JsonDecoding.fetch(moduleDecod: ModelFriends.self, url: url) { (json) in
            DispatchQueue.main.async {
                //теперь делается в потоке main
                print(json)
            }
        }
    }
}

