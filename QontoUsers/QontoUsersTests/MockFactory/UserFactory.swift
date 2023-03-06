//
//  UserFactory.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation
import RealmSwift

@testable import QontoUsers

final class UserFactory {
    static func create() -> QontoUsers.User {
        return User(name: Name(nickname: "",
                               firstname: "",
                               lastname: ""),
                    emailAddress: "")
    }
}
