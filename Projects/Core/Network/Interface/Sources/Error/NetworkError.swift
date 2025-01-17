//
//  NetworkError.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public enum NetworkError: Error {
    case connectionRefused
    case cancelled
    case noResponse
    case unauthorized
    case notFound
    case error(statusCode: Int)
    case error(Error)
    case urlGeneration
}
