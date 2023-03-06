//
//  DataFetcherManager.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

struct DataFetcherManager: DataFetching {
    private var dataFetcher: Fetching
    private var parser: Parsing
    
    init(dataFetcher: Fetching, parser: Parsing) {
        self.dataFetcher = dataFetcher
        self.parser = parser
    }
    
    func fetch<T: Decodable>(routing: Routing) -> Single<T> {
        dataFetcher.fetchData(routing: routing).flatMap {
            self.parser.parse(data: $0)
        }
    }
}
