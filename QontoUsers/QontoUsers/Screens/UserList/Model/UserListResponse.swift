//
//  UserListResponse.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

struct UserListResponse: Decodable {
    let users: [User]
    let information: Information
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
        case information = "info"
    }
}

struct User: Decodable {
    let name: Name
    let emailAddress: String
    
    var fullName: String {
        return "\(name.firstname) \(name.lastname)"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case emailAddress = "email"
    }
}

struct Name: Decodable {
    let nickname: String
    let firstname: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case nickname = "title"
        case firstname = "first"
        case lastname = "last"
    }
}

struct Information: Decodable {
    let seed: String?
    let version: String?
}

