//
//  MockSessionManager.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation
import CoreNetworkInterface

public struct MockSessionManager: NetworkSessionManager {
    private var session: URLSession
    
    public init() {
        var config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
    }
    
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionTask? {
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
    
    public func request(_ request: URLRequest) async throws -> (Data, URLResponse) {
        return try await session.data(for: request)
    }
}
