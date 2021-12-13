//
//  RealmManager.swift
//  clitnt-server-1641
//
//  Created by Максим Воеводин on 05.12.2021.
//

import Foundation
import RealmSwift

class RealmManager {
    
    var realm = try! Realm()
    

    func setDataToRealm<T: Object> (_ object: T) {
        do {
            //let realm = try Realm()
            
            //let verRealm = Realm.Configuration(schemaVersion:36)
            //let realm = try Realm(configuration: verRealm)//let verRealm = Realm.Configuration(schemaVersion:36)
            //let realm = try Realm(configuration: verRealm)
            let verRealm = Realm.Configuration(schemaVersion:36)
            let realm = try Realm(configuration: verRealm)
            
            
            realm.beginWrite()
            realm.add(object, update: .all)
            
            try realm.commitWrite()
            print(realm.configuration.fileURL ?? "")
        } catch {
            print(error)
        }
    }
    
    func getDataFromRealm<T: Object> (data: T) -> [Any] {
        let realm = try! Realm()
        let list = realm.objects(T.self)
        return Array(list)
    }
    
}
