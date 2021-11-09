//
//  AuthorizeVK.swift
//  clitnt-server-1641
//
//  Created by maxim on 08.11.2021.
//

import Foundation
import WebKit

protocol AuthorizeVKDelegateProtocol: NSObjectProtocol {
    var webview: WKWebView! {get set}
}

class AuthorizeVK {
    
    weak private var delegateAuthorizeVK : AuthorizeVKDelegateProtocol?
    
    let host:String
    let path:String
    var params: [String: String]

    init(){
  
        // enum rawValue получаем значение по enum
        self.path = EnumHost.Urlmodule.auth.rawValue
        self.host = EnumHost.BaseURL.auth.rawValue

        self.params = [
            "client_id": "7892031",
            "display" : "mobile",
            "redirect_uri": "https://oauth.vk.com/blank.html",
            "scope" : "262150",
            "response_type" : "token",
            "v" : "5.68"
        ]
    }

        //формируем корректный со всеми параметрами запрос на сервер
 
    func authorizeToVKAPI(){
       
        guard let url = UrlBuilderRequest.urlBuilderRequest(host: host, path: path, params: params) else { return }
        
        let result = URLRequest(url: url)
        
        delegateAuthorizeVK?.webview.load(result)
    }
    func setСonnectionDelegate(delegateProtocol:AuthorizeVKDelegateProtocol){
        print("setСonnectionDelegate")
        ///устанавливаю зависимость-связь он словно говорит
        /// мой протокол это и твой протокол теперь все что в протоколе
        /// я могу видить в этом коде и менять значение где расширяется протоколом
        /// в нашем случае могу читать и менять webview
        self.delegateAuthorizeVK = delegateProtocol
    }
}
