//
//  EnumHost.swift
//  clitnt-server-1641
//
//  Created by maxim on 27.10.2021.
//

import Foundation

class EnumHost {
    
    enum BaseURL: String {
        case auth = "oauth.vk.com"
        case api = "api.vk.com"
    }
    
    enum Urlmodule: String {
        case auth = "/authorize"
        case friends = "/method/friends.get"
        case groups = "/method/groups.get"
        case groupsSearch = "/method/groups.search"
        case photos = "/method/photos.getAll"
    }

    
}

