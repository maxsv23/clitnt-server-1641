//
//  Session.swift
//  clitnt-server-1641
//
//  Created by maxim on 25.10.2021.
//

import Foundation

final class Session {
    
    static var shared = Session()
    
    var token: String = "22"
    var userID: String = "22"
    
    private init() {}
}
