//
//  UserEntity+Mapping.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import Foundation
import CoreData
import SharedStorage

public extension UserEntity {
    convenience init(user: User, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = Int64(user.id)
        self.url = user.url
        self.type = Int16(user.type.rawValue)
        self.name = user.name
        self.userName = user.userName
        self.insertedAt = Date()
    }
}

public extension UserEntity {
    func toDomain()-> User {
        return .init(
            id: Int(self.id),
            type: .init(rawValue: Int(self.type)) ?? .unknown,
            userName: self.userName!,
            name: self.name!,
            url: self.url!
        )
    }
}
