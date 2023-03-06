//
//  DataFetcherManagerAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

struct DataFetcherManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataFetching.self) { r in DataFetcherManager(dataFetcher: r.resolve(Fetching.self)!, parser: r.resolve(Parsing.self)!)
        }
    }
}
