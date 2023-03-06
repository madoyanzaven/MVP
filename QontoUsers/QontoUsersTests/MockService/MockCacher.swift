//
//  MockCacher.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation
import RxSwift
import RealmSwift

@testable import QontoUsers

final class MockCacher: Caching {
    var realm: Realm = try! Realm()
    
    func fetchUsers() -> Single<[QontoUsers.User]> {
        Single.create { single in
            let response = UserListResponseFactory.createUserResponse()
            
            single(.success(response.users))
            
            return Disposables.create()
        }
    }
    
    func saveUsers(users: [QontoUsers.User]) {}
}
