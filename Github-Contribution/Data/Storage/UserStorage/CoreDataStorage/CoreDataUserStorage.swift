//
//  CoreDataUserStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData
import RxSwift
import RxCocoa

final class CoreDataUserStorage: UserStorage {
    private var nextId: Int16 {
        return Int16(users.value.count + 1)
    }
    
    private let storage: CoreDataStorage
    private lazy var users: BehaviorRelay<[User]> = .init(value: [])
    
    init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        storage.performBackgroundTask { [unowned self] context in
            do {
                let request: NSFetchRequest = UserEntity.fetchRequest()
                
                let result = try context.fetch(request).map { $0.toDomain() }
                users.accept(result)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func deleteUser(id: Int) {
        storage.performBackgroundTask { context in
            let request: NSFetchRequest = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id = %@", Int16(id))
            
            do {
                if let result = try context.fetch(request).first {
                    context.delete(result)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func saveUser(user: User) {
        storage.performBackgroundTask { [weak self] context in
            guard let self = self else { return }
            do {
                let entity = UserEntity.init(profile: user, insertInto: context)
                entity.id = nextId
                try context.save()
            } catch {
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
