//
//  UserListParameter.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

struct UserListParameter: Routing {
    let page: Int
    
    var api: Constants.API {
        return .userList
    }
    
    var parameters: [String: Any] {
        let parameters: [String: Any] = [
            "page": page,
            "results": Constants.Foundation.limitPageCount,
            "seed": "abc",
            "inc": "name,email"
        ]
        
        return parameters
    }
}
