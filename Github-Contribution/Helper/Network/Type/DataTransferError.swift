//
//  DataTransferError.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case parse(Error)
    case networkFailure(NetworkError)
}
