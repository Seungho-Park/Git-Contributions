//
//  EndPoint.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import CoreNetworkInterface

public struct EndPoint<R>: ResponseRequestable {
    public typealias Response = R
    
    public var path: String
    public var httpMethod: HttpMethod
    public var httpHeaders: [String : String]
    public var urlParameters: [String : Any]
    public var httpBody: (any Encodable)?
    public var bodyEncoder: any RequestBodyEncoder
    public var responseDecoder: any ResponseDecoder
    
    public init(
        path: String,
        httpMethod: HttpMethod = .get,
        httpHeaders: [String : String] = [:],
        urlParameters: [String : Any] = [:],
        httpBody: Encodable? = nil,
        bodyEncoder: any RequestBodyEncoder = JSONBodyEncoder(),
        responseDecoder: ResponseDecoder = JSONResponseDecoder()
    ) {
        self.path = path
        self.httpMethod = httpMethod
        self.httpHeaders = httpHeaders
        self.urlParameters = urlParameters
        self.httpBody = httpBody
        self.bodyEncoder = bodyEncoder
        self.responseDecoder = responseDecoder
    }
}
