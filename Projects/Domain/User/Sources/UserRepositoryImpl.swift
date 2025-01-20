//
//  UserRepositoryImpl.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import CoreStorageInterface
import SharedStorage
import CoreData
import DomainUserInterface

public final class UserRepositoryImpl: UserRepository {
    private let storage: CoreDataStorage
    
    public init(storage: CoreDataStorage) {
        self.storage = storage
    }
    
    public func fetchUserList(completion: @escaping (Result<[User], Error>)-> Void) {
        storage.performBackgroundTask { context in
            let request = UserEntity.fetchRequest()
            request.sortDescriptors = [
                NSSortDescriptor(key: #keyPath(UserEntity.insertedAt), ascending: true)
            ]
            do {
                completion(.success(try context.fetch(request).map { $0.toDomain() }))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
