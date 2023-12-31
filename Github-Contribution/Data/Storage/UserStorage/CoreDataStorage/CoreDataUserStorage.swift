//
//  CoreDataUserStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData
import RxSwift

final class CoreDataUserStorage: UserStorage {
    private var nextId: Int16 {
        let id = UserDefaults.standard.integer(forKey: "net.devswift.git-contributions.CoreDataUserStorage.seq") + 1
        UserDefaults.standard.setValue(id, forKey: "net.devswift.git-contributions.CoreDataUserStorage.seq")
        return Int16(id)
    }
    
    private let storage: CoreDataStorage
    
    init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    func getUserCount(completion: @escaping (Result<Int, Error>) -> Void) {
        storage.performBackgroundTask { context in
            do {
                let request = UserEntity.fetchRequest()
                completion(.success(try context.count(for: request)))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        storage.performBackgroundTask { context in
            do {
                let request: NSFetchRequest = UserEntity.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: #keyPath(UserEntity.userId), ascending: false)]
                
                let result = try context.fetch(request).map { $0.toDomain() }
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func deleteUser(id: Int, completion: @escaping (Result<User, Error>)-> Void) {
        storage.performBackgroundTask { context in
            let request: NSFetchRequest = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id = %@", Int16(id))
            
            do {
                if let result = try context.fetch(request).first {
                    context.delete(result)
                    completion(.success(result.toDomain()))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveUser(user: User, completion: @escaping (Result<User, Error>)-> Void) {
        storage.performBackgroundTask { [weak self] context in
            guard let self = self else { return }
            do {
                let entity = UserEntity.init(profile: user, insertInto: context)
                entity.userId = nextId
                try context.save()
                
                let domain = entity.toDomain()
                completion(.success(domain))
            } catch {
                completion(.failure(error))
                debugPrint("CoreDataUserStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
