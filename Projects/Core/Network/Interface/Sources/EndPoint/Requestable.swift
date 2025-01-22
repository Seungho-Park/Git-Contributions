//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation
import SharedUtils

public protocol Requestable {
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var httpHeaders: [String:String] { get }
    var urlParameters: [String:Any] { get }
    var httpBody: Encodable? { get }
    var bodyEncoder: RequestBodyEncoder { get }
    var responseDecoder: ResponseDecoder { get }
    
    func urlRequest() throws -> URLRequest
}

public extension Requestable {
    private func url() throws -> URL {
        guard var urlComponents = URLComponents(string: path) else {
            throw RequestGenerationError.components
        }
        
        let urlQueryParameters = urlParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        urlComponents.queryItems = urlQueryParameters.isEmpty ? nil: urlQueryParameters
        
        guard let url = urlComponents.url else {
            throw RequestGenerationError.components
        }
        
        return url
    }
    
    func urlRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try url())
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        if let bodyParameters = httpBody?.queryParameters,
           let httpBody = bodyEncoder.encode(bodyParameters) {
            urlRequest.httpBody = httpBody
        }
        
        return urlRequest
    }
}
