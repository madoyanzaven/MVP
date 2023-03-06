//
//  UserPresenterBusinessRulesTests.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import XCTest
@testable import QontoUsers

final class UserPresenterBusinessRulesTests: XCTestCase {
    private struct MockedUserPresenterBusinessRules: UserPresenterBusinessRules {}
    private let userPresenterBusinessRulesTests = MockedUserPresenterBusinessRules()
    
    override func tearDown() {
        super.tearDown()

    }
    
    func test_isNetworkAvailable() {
        let actualResult = userPresenterBusinessRulesTests.isNetworkAvailable()
        
        XCTAssertTrue(actualResult)
    }
}
