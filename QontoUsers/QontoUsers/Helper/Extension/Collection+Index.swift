//
//  Collection+Index.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation

extension Collection {
    subscript (safe index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }
        
        return self[index]
    }
}
