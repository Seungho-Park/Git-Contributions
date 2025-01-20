//
//  UserRepositoryImpl.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import CoreStorageInterface
import DomainUserInterface

public final class UserRepositoryImpl: UserRepository {
    private let storage: CoreDataStorage
    
    public init(storage: CoreDataStorage) {
        self.storage = storage
    }
    
    public func fetchUserList() {
        
    }
}
