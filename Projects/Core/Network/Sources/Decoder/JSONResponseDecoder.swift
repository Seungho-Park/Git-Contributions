//
//  JSONResponseDecoder.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation
import CoreNetworkInterface

public struct JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder: JSONDecoder
    
    public init(_ jsonDecoder: JSONDecoder = .init()) {
        self.jsonDecoder = jsonDecoder
    }
    
    public func decode<T>(_ data: Data) throws -> T where T : Decodable {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
