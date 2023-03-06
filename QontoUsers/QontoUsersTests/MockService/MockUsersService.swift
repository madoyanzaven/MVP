//
//  MockUsersService.swift
//  QontoUsersTests
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation
import RxSwift
@testable import QontoUsers

final class MockUsersService: BaseMockService, UserListServicing {
    func fetch(routing: UserListParameter) -> Single<UserListResponse> {
        fetchMethodCallCount += 1
        
        return Single.create { single in
            guard !self.shouldThrowError else {
                single(.failure(MockError.failure))
                
                return Disposables.create()
            }
            
            let response = UserListResponseFactory.createUserResponse()
            
            single(.success(response))
            
            return Disposables.create()
        }
    }
}
