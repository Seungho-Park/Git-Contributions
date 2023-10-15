//
//  CoreDataProfileStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation

final class CoreDataProfileStorage {//: AccountStorage {
    private let coreDataStorage: CoreDataStorage
    
    init(coreDataStorage: CoreDataStorage = .shared) {
        self.coreDataStorage = coreDataStorage
    }
    
//    func fetchAccounts(completion: @escaping (Result<[Profile], Error>) -> Void) {
//        coreDataStorage.performBackgroundTask { context in
//            do {
//                let request = Account.fetchRequest()
//                let result = try context.fetch(request).map { $0.toDomain() }
//                completion(.success(result))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    func saveAccount(profile: Profile, completion: @escaping (Result<Profile, Error>) -> Void) {
//        coreDataStorage.performBackgroundTask { context in
//            do {
//                let account = Account(profile: profile, context: context)
//                try context.save()
//                
//                completion(.success(account.toDomain()))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }
}
