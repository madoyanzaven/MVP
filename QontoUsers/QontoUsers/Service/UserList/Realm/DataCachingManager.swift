//
//  DataCachingManager.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import RxSwift

struct DataCachingManager: DataCaching {
    var cacher: Caching
    
    func fetchUsers() -> Single<[User]> {
        return cacher.fetchUsers()
    }
    
    func saveUsers(users: [User]) {
        return cacher.saveUsers(users: users)
    }
}
