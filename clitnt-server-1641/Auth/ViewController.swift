//
//  ViewController.swift
//  clitnt-server-1641
//
//  Created by maxim on 20.10.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, AuthorizeVKDelegateProtocol {
//class ViewController: UIViewController, AuthorizeVKDelegateProtocol {
   
    
    ///делегуруем через протокол для того чтобы вынести логику в другой класс
    ///создадим класс авторизация но не будем его сразу запускать инициализацию /?/
   
    
   
    
    @IBOutlet weak var webview: WKWebView! {
        didSet {

            webview.navigationDelegate = self
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //устанавливаю зависимость-связь с экземпляром класса AuthorizeVK()  его методами-свофствами
        let authorizeVKDelegateItem = AuthorizeVK()
        authorizeVKDelegateItem.setСonnectionDelegate(delegateProtocol: self)
        
        
        //авторизация
        authorizeVKDelegateItem.authorizeToVKAPI()
        
        //запрос друзей
      //  GetFriends().setDataFromSiteToRealmswiftDB()
        
        
    }


    
    
    

    
    
}
