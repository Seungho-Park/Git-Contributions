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
    
    public func fetchUserList(completion: @escaping (Result<[User], any Error>) -> Void) {
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
    
    public func fetchUserList() async throws -> [User] {
        return try await withCheckedThrowingContinuation { continuation in
            storage.performBackgroundTask { context in
                let request = UserEntity.fetchRequest()
                request.sortDescriptors = [
                    NSSortDescriptor(key: #keyPath(UserEntity.insertedAt), ascending: true)
                ]
                do {
                    continuation.resume(returning: try context.fetch(request).map { $0.toDomain() })
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    @discardableResult
    public func save(_ user: User) async -> Bool {
        return await withCheckedContinuation { continuation in
            storage.performBackgroundTask { context in
                do {
                    try self.removeDuplicate(user, in: context)
                    _ = UserEntity(user: user, insertInto: context)
                    try context.save()
                    continuation.resume(returning: true)
                } catch {
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    public func save(_ user: User, completion: @escaping (Bool)-> Void) {
        storage.performBackgroundTask { context in
            do {
                try self.removeDuplicate(user, in: context)
                _ = UserEntity(user: user, insertInto: context)
                try context.save()
                completion(true)
            } catch {
                print(error)
                completion(false)
            }
        }
    }
    
    private func removeDuplicate(_ user: User, in context: NSManagedObjectContext) throws {
        let request = UserEntity.fetchRequest()
        request.predicate = NSPredicate(
            format: "id = \(Int64(user.id)) AND type = \(Int16(user.type.rawValue))")
        
        try context.fetch(request).forEach {
            context.delete($0)
        }
    }
}
