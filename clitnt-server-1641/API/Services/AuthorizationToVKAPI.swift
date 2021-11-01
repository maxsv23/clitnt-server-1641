//
//  АuthVK.swift
//  clitnt-server-1641
//
//  Created by maxim on 28.10.2021.
//

import Foundation
import UIKit

class AuthorizationToVKAPI {

    let host:String
    let path:String
    let params: [String: String]

    init(){
        // enum rawValue получаем значение по enum
        self.host = EnumHost.BaseURL.auth.rawValue
        self.path = EnumHost.Urlmodule.auth.rawValue
        self.params = [
            "client_id" : "7892031",
            "display": "mobile",
            "redirect_uri" : "https://oauth.vk.com/blank.html",
            "scope": "262150",
            "response_type" : "token",
            "v" : "5.81"
        ]
    }

  func getModel () {

//        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }

        //let request = URLRequest(url: url)
        
       // webview.load(request)
    }

}
