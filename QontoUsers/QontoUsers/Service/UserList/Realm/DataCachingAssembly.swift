//
//  DataCachingAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import Swinject
import RealmSwift

struct DataCachingAssembly: Assembly {
    let config = Realm.Configuration(inMemoryIdentifier: "MyRealm")
    let realm = try! Realm(configuration: .defaultConfiguration)
    
    func assemble(container: Container) {
        container.register(Caching.self) { r in Cacher(realm: realm)}
    }
}

