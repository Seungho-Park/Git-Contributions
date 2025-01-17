//
//  Encodable+Extension.swift
//  SharedUtils
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation

public extension Encodable {
    var queryParameters: [String:Any] {
        if let data = try? JSONEncoder().encode(self),
           let jsonData = try? JSONSerialization.jsonObject(with: data)
        {
            return jsonData as? [String : Any] ?? [:]
        }
        
        return [:]
    }
}
