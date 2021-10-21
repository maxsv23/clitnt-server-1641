//Практическое задание
//Добавить в проект синглтон для хранения данных о текущей сессии – Session
//Добавить в него свойства:
//token: String – для хранения токена в VK,
//userId: Int – для хранения идентификатора пользователя ВК.


import UIKit

class ViewController: UIViewController {
   
    // каждый раз при обращении к синглтону в каждом контроллере обьявляем 
    let session = Session.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // нажал кнопку жизненый цикл продолжится и userId будет равен другому значению
    
      override func viewWillAppear(_ animated: Bool) {
         session.userId = 4
     }
      
     // override func viewDidAppear(_ animated: Bool) {
     //    session.userId = 5
     // }

}

