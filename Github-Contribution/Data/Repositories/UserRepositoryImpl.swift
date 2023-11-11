//
//  UserRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 11/11/23.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let userStorage: UserStorage
    
    init(userStorage: UserStorage) {
        self.userStorage = userStorage
    }
}
