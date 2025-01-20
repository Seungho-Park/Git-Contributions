//
//  FetchUserListUsecaseImpl.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import DomainUserInterface
import SharedThirdPartyLibs

public final class FetchUserListUseCaseImpl: FetchUserListUseCase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute()-> Single<[User]> {
        return Single<[User]>.create { [unowned self] single in
            userRepository.fetchUserList { result in
                switch result {
                case .success(let users): single(.success(users))
                case .failure(let error): single(.failure(error))
                }
            }
            
            return Disposables.create()
        }
    }
}
