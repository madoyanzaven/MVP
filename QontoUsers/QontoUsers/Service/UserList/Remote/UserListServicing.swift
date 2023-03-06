//
//  UserListServicing.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

protocol UserListServicing {
    func fetch(routing: UserListParameter) -> Single<UserListResponse>
}
