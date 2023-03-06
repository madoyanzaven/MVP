//
//  CacheConvertingBusinessRules.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 09.11.22.
//

import Foundation

protocol CacheConvertingBusinessRules {
    func convertToRealmUser(users: [User]) -> [RealmUser]
    func convertToUser(realmUsers: [RealmUser]) -> [User]
}

extension CacheConvertingBusinessRules {
    func convertToRealmUser(users: [User]) -> [RealmUser] {
        var realmUsers: [RealmUser] = []
        
        for user in users {
            let realmUser = RealmUser()
            let nameObject = NameObject()
            nameObject.nickname = user.name.nickname
            nameObject.firstname = user.name.firstname
            nameObject.lastname = user.name.lastname
            realmUser.name = nameObject
            realmUser.email = user.emailAddress
            
            realmUsers.append(realmUser)
        }
        
        return realmUsers
    }
    
    func convertToUser(realmUsers: [RealmUser]) -> [User] {
        let users = realmUsers.map { user in
            User(name: Name(nickname: user.name?.nickname ?? "",
                            firstname: user.name?.firstname ?? "",
                            lastname: user.name?.lastname ?? ""),
                 emailAddress: user.email)
        }
        
        return users
    }
}
