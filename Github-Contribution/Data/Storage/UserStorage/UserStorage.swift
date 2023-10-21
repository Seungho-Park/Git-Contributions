//
//  UserStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation

protocol UserStorage {
    func fetchUsers(completion: @escaping (Result<[User], Error>)-> Void)
    func saveUser(user: User)
}
