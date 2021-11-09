//
//  WKNavigationDelegate.swift
//  clitnt-server-1641
//
//  Created by maxim on 09.11.2021.
//

import Foundation
import WebKit

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"], let userID = params["user_id"] else {return}
        
        Session.shared.token = token
        Session.shared.userID = userID
        decisionHandler(.cancel)
        
        print(Session.shared.userID)
        print(Session.shared.token)
        
        GetFriends().setDataFromSiteToRealmswiftDB()
        
        
    }
    
}
