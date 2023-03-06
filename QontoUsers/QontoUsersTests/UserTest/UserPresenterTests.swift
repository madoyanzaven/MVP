//
//  UserPresenterTests.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import XCTest
import RealmSwift
@testable import QontoUsers

class UserPresenterTests: XCTestCase {
    var presenter: UserPresenter!
    var service: MockUsersService!

    override func setUp() {
        super.setUp()

        service = MockUsersService()
        
        let inputs = UserListInputs(userListService: service,
                                    cachingService: MockCacher())

        presenter = UserPresenter(input: inputs)
    }

    override func tearDown() {
        super.tearDown()

        presenter = nil
        service = nil
    }

    func test_FetchData() {
        XCTAssertEqual(service.fetchMethodCallCount, 0, "fetchMethodCallCount default value is 0, fetch count is \(service.fetchMethodCallCount)")

        presenter.getData()

        XCTAssertEqual(service.fetchMethodCallCount, 1, "fetchMethodCallCount is  \(service.fetchMethodCallCount), expected value: 1")
    }
}
