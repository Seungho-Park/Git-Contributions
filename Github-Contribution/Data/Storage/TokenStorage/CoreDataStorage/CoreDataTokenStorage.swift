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
}
