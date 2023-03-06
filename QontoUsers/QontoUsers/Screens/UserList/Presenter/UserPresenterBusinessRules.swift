//
//  UserPresenterBusinessRules.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation

protocol UserPresenterBusinessRules {
    func isNetworkAvailable() -> Bool
}

extension UserPresenterBusinessRules {
    func isNetworkAvailable() -> Bool {
        return Reachability().isConnectedToNetwork()
    }
}
