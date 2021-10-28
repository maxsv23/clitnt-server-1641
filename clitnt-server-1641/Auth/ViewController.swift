//
//  ViewController.swift
//  clitnt-server-1641
//
//  Created by maxim on 20.10.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView! {
        didSet {
            
            webview.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    authorizeToVKAPI()
    

        ///запускать нужно после авторизации )))) когда получим ключ  от вк
        ///FriendsAPI().jsonString()
        ///ну а пока можно запускать для теста после авторизации ))))
        
    }
  


    func authorizeToVKAPI() {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7892031"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)

        webview.load(request)
    }

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
        
        /// ТУТ ТЕСТОВЫЕ запуски получения JSON стринг
        /// FriendsAPI().jsonString()
        ///
        ///
        print("************* TEST OK ******************")
        //GetFriends().jsonString()
        print("************* TEST OK ******************")
        //GetGroups().jsonString()
        print("************* TEST OK ******************")
        //GetGroupsSeatch().jsonString()
        print("************* TEST OK ******************")
        //GetPhotos().jsonString()
        print("************* TEST OK ******************")
    
    }

}
