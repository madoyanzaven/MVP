//
//  RealmUser.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @objc dynamic var name: NameObject? = NameObject()
    @objc dynamic var email = ""
}

class NameObject: Object {
    @objc dynamic var nickname = ""
    @objc dynamic var firstname = ""
    @objc dynamic var lastname = ""
}

class RealmData: Object {
    let users = List<RealmUser>()
}
