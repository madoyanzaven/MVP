//
//  UserListResponseFactory.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation
import RealmSwift

@testable import QontoUsers

final class UserListResponseFactory {
    static func createUserResponse() -> UserListResponse {
        return UserListResponse(
            users: [
                UserFactory.create()
            ],
            information: Information(seed: nil,
                                     version: "1.1.1"))
    }
}
