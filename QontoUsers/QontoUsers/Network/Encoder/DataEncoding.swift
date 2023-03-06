//
//  DataEncoding.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

protocol DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any])
}
