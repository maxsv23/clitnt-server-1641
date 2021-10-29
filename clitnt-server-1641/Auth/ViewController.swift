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
        //  GetFriends().jsonString()
        print("************* TEST OK ******************")
        //GetGroups().jsonString()
        print("************* TEST OK ******************")
        //GetGroupsSeatch().jsonString()
        print("************* TEST OK ******************")
        //GetPhotos().jsonString()
        print("************* TEST OK ******************")
        
        
        let url2 = URL(string: "https://api.vk.com/method/friends.get?order=name&count=3&v=5.81&fields=nickname&access_token=4556843c3882fc4e01cc93672fb583a35534f9c1d5071bfdc823ee12df3c16933154032f8cd01a9890219&user_id=630570554")!
        
        URLSession.shared.dataTask(with: url2) { data, response, error in
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {
                      return
                  }
            
            
            
            let array = json as! [Any]
            for userJson in array {
                let userJson  = userJson as! [String: Any]
                let id = userJson["id"] as! Int
                let name = userJson["name"] as! String
                let username = userJson["username"] as! String
                let email = userJson["email"] as! String
                let addressJson = userJson["address"] as! [String: Any]
                let street = addressJson["street"] as! String
                let suite = addressJson["suite"] as! String
                let city = addressJson["city"] as! String
                let zipcode = addressJson["zipcode"] as! String
                let geoJson = addressJson["geo"] as! [String: Any]
                let lat = geoJson["lat"] as! String
                let lng = geoJson["lng"] as! String
                let phone = userJson["phone"] as! String
                let website = userJson["website"] as! String
                let companyJson = userJson["company"] as! [String: Any]
                let companyName = companyJson["name"] as! String
                let catchPhrase = companyJson["catchPhrase"] as! String
                let bs = companyJson["bs"] as! String
                
                print(id, name, username, email, street, suite, city, zipcode, lat, lng, phone, website, companyName, catchPhrase, bs)
                
            }
          
        }.resume()
    }
}
