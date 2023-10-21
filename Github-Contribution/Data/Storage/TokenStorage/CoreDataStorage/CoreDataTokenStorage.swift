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
    
    func fetchTokens(type: VCSType, host: String?, completion: @escaping (Result<[AccessToken], Error>)-> Void) {
        storage.performBackgroundTask { context in
            let request = TokenEntity.fetchRequest()
            let predicate: NSPredicate
            
            if let host = host {
                predicate = NSPredicate(format: "type == %@ AND host == %@", Int32(type.rawValue), host)
            } else {
                predicate = NSPredicate(format: "type == %@", Int32(type.rawValue))
            }
            request.predicate = predicate
            
            do {
                let response = try context.fetch(request).map { $0.toDomain() }
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
