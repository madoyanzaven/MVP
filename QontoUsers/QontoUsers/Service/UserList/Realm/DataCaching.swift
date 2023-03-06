//
//  DataCaching.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//
import Foundation
import RxSwift

protocol DataCaching {
    var cacher: Caching { get set }

    init(cacher: Caching)

    func fetchUsers() -> Single<[User]>
    func saveUsers(users: [User])
}
