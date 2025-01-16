//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation

public protocol Requestable {
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var httpHeaders: [String:String] { get }
    var urlParameters: [String:Any] { get }
    var httpBody: Encodable? { get }
    var responseDecoder: ResponseDecoder { get }
    
    func urlRequest() throws -> URLRequest
}

public extension Requestable {
    private func url() throws -> URL {
        return URL(string: "")!
    }
    
    func urlRequest() throws -> URLRequest {
        return .init(url: URL(string: "")!)
    }
}
