//
//  UserListServiceAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

final class UserListServiceAssembly: Assembly {
    func assemble(container: Container) {
        let isMock = Environment.isMock

        if isMock {
            container.register(UserListServicing.self) { _ in UserListMockService(dataFetcher: DataFetcherManagerProvider.mock)}
        } else {
            container.register(UserListServicing.self) { _ in UserListWebService(dataFetcher: DataFetcherManagerProvider.web)}
        }
    }
}
