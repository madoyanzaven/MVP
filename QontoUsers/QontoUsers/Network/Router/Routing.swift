//
//  Routing.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

protocol Routing {
    var api: Constants.API { get }
    var baseUrl: URL { get }
    var httpMethod: HTTPMethod { get }
    var acceptableStatusCodes: Set<Int> { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var parameterEncoder: DataEncoding { get }
    var urlRequest: URLRequest { get }
}

extension Routing {
    var baseUrl: URL {
        guard let baseUrl = URL(string: Constants.BaseUrl.qontoUser ) else {
            preconditionFailure("CustomError.NetworkError.missingURL.rawValue")
        }
        
        return baseUrl
    }
    
    var httpMethod: HTTPMethod { return .get }
    
    var acceptableStatusCodes: Set<Int> { return [200, 201] }
    
    var headers: [String : String] {
        let parameters = [
            "Content-Type": "application/json"
        ]
        
        return parameters
    }
    
    var parameters: [String: Any] { return [:] }
    
    var parameterEncoder: DataEncoding { return URLEncoder() }
    
    var urlRequest: URLRequest {
        let url = baseUrl.appendingPathComponent(api.path)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod.rawValue
        parameterEncoder.encode(urlRequest: &urlRequest, parameters: parameters)
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
