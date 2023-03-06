//
//  JsonDecoderParserAssembly.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation
import Swinject

struct JsonDecoderParserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Parsing.self) { _ in JsonDecoderParser() }
    }
}
