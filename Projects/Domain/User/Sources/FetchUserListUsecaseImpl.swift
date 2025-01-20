//
//  FetchUserListUsecaseImpl.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import DomainUserInterface

public final class FetchUserListUsecaseImpl: FetchUserListUsecase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute() {
        userRepository.fetchUserList { result in
            
        }
    }
}
