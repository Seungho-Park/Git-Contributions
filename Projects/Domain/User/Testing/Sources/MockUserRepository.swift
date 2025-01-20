//
//  MockUserRepository.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import CoreStorageInterface
import DomainUserInterface

public final class MockUserRepository: UserRepository {
    private let storage: CoreDataStorage
    
    public init(storage: CoreDataStorage) {
        self.storage = storage
    }
    
    public func fetchUserList(completion: @escaping (Result<[User], any Error>) -> Void) {
        
    }
}
