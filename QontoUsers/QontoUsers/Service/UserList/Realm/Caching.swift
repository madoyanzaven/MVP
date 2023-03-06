//
//  Caching.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import RxSwift
import RealmSwift

protocol Caching {
    var realm: Realm { get set }
    
    func fetchUsers() -> Single<[User]>
    func saveUsers(users: [User])
}
