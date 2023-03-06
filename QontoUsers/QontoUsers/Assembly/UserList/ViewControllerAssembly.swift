//
//  ViewControllerAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserPresenter.self) { r in
            let inputs = UserListInputs(userListService: r.resolve(UserListServicing.self)!,
                                        cachingService: r.resolve(Caching.self)!)
            
            return UserPresenter(input: inputs)
        }
        
        container.register(UserTableViewController.self) { r in
            let vc = UserTableViewController()
            vc.presenter = r.resolve(UserPresenter.self)!
            
            return vc
        }
    }
}
