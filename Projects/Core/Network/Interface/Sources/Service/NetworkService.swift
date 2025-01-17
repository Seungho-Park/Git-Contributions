//
//  NetworkService.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation

public protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkError>)-> Void
    
    func request(with endpoint: Requestable, completion: @escaping CompletionHandler)-> URLSessionTask?
    func request(with endpoint: Requestable) async -> Result<Data?, NetworkError>
}
