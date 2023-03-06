//
//  Fetching.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

protocol Fetching {
    func fetchData(routing: Routing) -> Single<Data>
}
