//
//  URLSessionNetworkManagerAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

struct URLSessionNetworkManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Fetching.self) { _ in URLSessionNetworkManager() }
    }
}
