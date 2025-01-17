//
//  JSONBodyEncoder.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation
import CoreNetworkInterface

public struct JSONBodyEncoder: RequestBodyEncoder {
    public func encode(_ body: [String : Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: body)
    }
    
    public init() {  }
}
