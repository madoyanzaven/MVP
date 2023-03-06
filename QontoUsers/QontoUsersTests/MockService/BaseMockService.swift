//
//  BaseMockService.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation

class BaseMockService {
    var fetchMethodCallCount = 0
    var shouldThrowError = false
}

enum MockError: Error {
    case failure
}
