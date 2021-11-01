//
//  GetPhotos.swift
//  clitnt-server-1641
//
//  Created by maxim on 28.10.2021.
//

import Foundation

class GetPhotos {
    
    let host:String
    let path:String
    var params: [String: String]

    
    init(){
        // enum rawValue получаем значение по enum
        self.host = EnumHost.BaseURL.api.rawValue
        self.path = EnumHost.Urlmodule.photos.rawValue
       

        self.params = [
            "extended": "1",
            "owner_id" : "1",
            "count": "3",
            "photo_sizes": "1",
            "no_service_albums": "0",
            "need_hidden": "0",
            "skip_hidden": "1",
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



