//
//  UserPresenting.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

protocol ViewInputDelegate: AnyObject {
    func setup()
    func displayUsers(users: [User])
}

protocol ViewOutputDelegate: AnyObject {
    func getData()
}

