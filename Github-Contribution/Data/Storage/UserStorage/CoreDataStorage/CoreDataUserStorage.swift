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
    private let storage: CoreDataStorage
    private lazy var users: BehaviorRelay<[User]> = .init(value: [])
    
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
    
    func saveUser(user: User) {
        storage.performBackgroundTask { context in
            do {
                let entity = UserEntity.init(profile: user, insertInto: context)
                
                try context.save()
            } catch {
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
