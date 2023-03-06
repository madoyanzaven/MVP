//
//  DataFetching.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

protocol DataFetching {
    init(dataFetcher: Fetching, parser: Parsing)
    func fetch<T: Decodable>(routing: Routing) -> Single<T>
}
