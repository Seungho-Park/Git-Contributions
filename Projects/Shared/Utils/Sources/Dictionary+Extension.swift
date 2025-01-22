//
//  Dictionary+Extension.swift
//  SharedUtils
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation

public extension Dictionary {
    var urlParameters: String {
        return self.map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
