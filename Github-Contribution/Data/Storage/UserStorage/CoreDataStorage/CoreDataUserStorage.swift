//
//  CoreDataUserStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData

final class CoreDataUserStorage: UserStorage {
    private let storage: CoreDataStorage
    
    init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        storage.performBackgroundTask { context in
            do {
                let request: NSFetchRequest = UserEntity.fetchRequest()
                
                let result = try context.fetch(request).map { $0.toDomain() }
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
