//
//  Parsing.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import RxSwift

protocol Parsing {
    func parse<T: Decodable>(data: Data) -> Single<T>
}
