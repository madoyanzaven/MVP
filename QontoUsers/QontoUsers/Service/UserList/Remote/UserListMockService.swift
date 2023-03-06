//
//  UserListMockService.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

final class UserListMockService: Service, UserListServicing {
    func fetch(routing: UserListParameter) -> Single<UserListResponse> {
        return call(routing: routing)
    }
}
