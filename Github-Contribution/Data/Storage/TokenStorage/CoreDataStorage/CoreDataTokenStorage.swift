//
//  CoreDataTokenStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData
import RxSwift
import RxCocoa

final class CoreDataTokenStorage: TokenStorage {
    private var nextSeq: Int16 {
        let id = UserDefaults.standard.integer(forKey: "net.devswift.git-contributions.CoreDataTokenStorage.seq") + 1
        UserDefaults.standard.setValue(id, forKey: "net.devswift.git-contributions.CoreDataTokenStorage.seq")
        return Int16(id)
    }
    
    private let storage: CoreDataStorage
    
    init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    func fetchTokens(completion: @escaping (Result<[AccessToken], Error>)-> Void) {
        storage.performBackgroundTask { context in
            let request = TokenEntity.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: #keyPath(TokenEntity.tokenId), ascending: false)]
            
            do {
                let response = try context.fetch(request).map { $0.toDomain() }
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveToken(token: AccessToken, completion: @escaping (Result<AccessToken, Error>)-> Void) {
        storage.performBackgroundTask { [weak self] context in
            guard let self = self else { return }
            let tokenEntity = TokenEntity(token: token, insertInto: context)
            tokenEntity.tokenId = nextSeq
            
            do {
                try context.save()
                completion(.success(tokenEntity.toDomain()))
            } catch {
                completion(.failure(error))
                debugPrint("CoreDataTokenStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
