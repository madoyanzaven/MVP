//
//  JsonFileFetcherAssemby.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

struct JsonFileFetcherAssemby: Assembly {
    func assemble(container: Container) {
        container.register(Fetching.self) { _ in JsonFileFetcher() }
    }
}
