//
//  Environment.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

enum Environment {
    case web
    case mock
    
    static var state = Environment.mock
    
    static func setEnvState() {
#if MOCK
        self.state = .mock
#elseif WEB
        self.state = .web
#else
        preconditionFailure("Unknown envirement. Please check your configurations")
#endif
    }
    
    static var isMock: Bool {
        return state == Environment.mock
    }
}
