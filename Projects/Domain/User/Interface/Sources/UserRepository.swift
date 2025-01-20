//
//  UserRepository.swift
//  Domain
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public protocol UserRepository {
    func fetchUserList(completion: @escaping (Result<[User], Error>)-> Void)
}
