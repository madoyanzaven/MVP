//
//  Cacher.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import RxSwift
import RealmSwift

final class Cacher: Caching, CacheConvertingBusinessRules {
    var realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func fetchUsers() -> Single<[User]> {
        return Single.create { single in
            let realmData: RealmData = self.realm.objects(RealmData.self).first ?? RealmData()
            let users = Array(realmData.users)
            
            single(.success(self.convertToUser(realmUsers: users)))
            
            return Disposables.create()
        }
    }
    
    func saveUsers(users: [User]) {
        try! realm.write {
            let data = RealmData()
            data.users.append(objectsIn: convertToRealmUser(users: users))
            realm.add(data)
        }
    }
}
