//
//  Service.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

class Service {
    private let dataFetcher: DataFetching

    init(dataFetcher: DataFetching) {
        self.dataFetcher = dataFetcher
    }

    func call<T: Decodable>(routing: Routing) -> Single<T> {
        return dataFetcher.fetch(routing: routing)
    }
}
