//
//  MockUserRepository.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import DomainUserInterface

public final class MockUserRepository: UserRepository {
    public func fetchUserList(completion: @escaping (Result<[User], any Error>) -> Void) {
        
    }
}
