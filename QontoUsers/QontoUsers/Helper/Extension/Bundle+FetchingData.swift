//
//  Bundle+FetchingData.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import Foundation

extension Bundle {
    func loadDataFromJsonFile(fileName: String, fileExtension: Extension = .json) throws -> Data {
        guard let url = self.url(forResource: fileName, withExtension: fileExtension.rawValue) else {
            throw CustomError.LoadingError.fileLocateFailed(filename: fileName)
        }
        
        guard let data = try? Data(contentsOf: url) else {
            throw CustomError.LoadingError.fileLoadFailed(filename: fileName)
        }
        
        return data
    }
}

enum Extension: String {
    case json
}
