//
//  NetworkSessionManager.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation

public protocol NetworkSessionManager {
    typealias CompletionHandler = (Data?, URLResponse?, Error?)-> Void
    
    func request(_ request: URLRequest, completion: @escaping CompletionHandler)-> URLSessionTask?
    func request(_ request: URLRequest) async throws -> (Data, URLResponse)
}
