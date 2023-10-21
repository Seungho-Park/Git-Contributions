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
        return Int16(tokens.value.count + 1)
    }
    
    private let storage: CoreDataStorage
    private lazy var tokens: BehaviorRelay<[AccessToken]> = .init(value: [])
    
    init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    func fetchTokens(completion: @escaping (Result<[AccessToken], Error>)-> Void) {
        storage.performBackgroundTask { [weak self] context in
            guard let self = self else { return }
            let request = TokenEntity.fetchRequest()
            
            do {
                let response = try context.fetch(request).map { $0.toDomain() }
                tokens.accept(response)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveToken(token: AccessToken) {
        storage.performBackgroundTask { [weak self] context in
            guard let self = self else { return }
            let tokenEntity = TokenEntity(token: token, insertInto: context)
            
            if tokenEntity.id == -1 {
                tokenEntity.id = nextSeq
            }
            
            do {
                try context.save()
            } catch {
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
