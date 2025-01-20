//
//  User.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public struct User: Equatable, Identifiable {
    public enum UserType: Int {
        case github = 1
        case gitlab = 2
        case unknown = 99
    }
    
    public var id: Int
    public var type: UserType
    public var userName: String
    public var name: String
    public var url: String
}
