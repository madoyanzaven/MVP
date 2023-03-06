//
//  JsonEncoder.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

struct JsonEncoder: DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any]) {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        
        urlRequest.httpBody = jsonData
    }
}
