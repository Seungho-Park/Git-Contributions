//
//  DataTransferError.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public enum DataTransferError: Error {
    case parsing(Error)
    case networkError(NetworkError)
}
