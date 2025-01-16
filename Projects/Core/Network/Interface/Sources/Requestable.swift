//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/16/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public protocol Requestable {
    var path: String { get }
    var isFullPath: Bool { get }
    var httpMethod: HttpMethod { get }
    var httpHeaders: [String:String] { get }
    var urlParameters: [String:Any] { get }
}
