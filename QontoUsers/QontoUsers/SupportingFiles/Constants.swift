//
//  Constants.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import UIKit

enum Constants {
    enum API {
        case userList
        
        var path: String {
            switch self {
            case .userList :
                return "/api/"
            }
        }
        
        var jsonFile: String {
            switch self {
            case .userList:
                return "UserList"
            }
        }
    }
}

extension Constants {
    enum BaseUrl {
        static var qontoUser = "https://randomuser.me"
    }
}

extension Constants {
    enum Foundation {
        static var limitPageCount = 10
    }
}
