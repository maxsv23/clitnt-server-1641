//
//  LastViewController.swift
//  clitnt-server-1641
//
//  Created by maxim on 20.10.2021.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var moneyView: UILabel!
    
    
    //первое обращение создает обьект второе обращение передает ссылку на обьект
    let session = Session.shared
 
    override func viewDidLoad() {
            super.viewDidLoad()

        nameView.text = session.token
        moneyView.text = String(session.userId)
        
        }

    
    // повторяем жизненый цикл контроллера
    
  //  override func viewWillAppear(_ animated: Bool) {
  //      session.userId = 4
  //  }
    
  //  override func viewDidAppear(_ animated: Bool) {
  //      session.userId = 5
  //  }
}
