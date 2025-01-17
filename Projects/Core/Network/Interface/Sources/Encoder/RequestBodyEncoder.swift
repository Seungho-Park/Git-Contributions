//
//  RequestBodyEncoder.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation

public protocol RequestBodyEncoder {
    func encode(_ body: [String:Any])-> Data?
}
