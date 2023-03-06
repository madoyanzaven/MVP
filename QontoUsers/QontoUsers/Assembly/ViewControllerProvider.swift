//
//  ViewControllerProvider.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import UIKit
import Swinject

enum ViewControllerProvider {}

extension ViewControllerProvider {
    enum Main {
        static var list: UserTableViewController {
            let assemblies: [Assembly] = [
                UserListServiceAssembly(),
                DataCachingAssembly(),
                ViewControllerAssembly()
            ]
            let assembler = Assembler(assemblies)
            let vc = assembler.resolver.resolve(UserTableViewController.self)!

            return vc
        }
    }
}
