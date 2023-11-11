//
//  UserRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 11/11/23.
//

import Foundation
import RxSwift

class UserRepositoryImpl: UserRepository {
    private let userStorage: UserStorage
    
    init(userStorage: UserStorage) {
        self.userStorage = userStorage
    }
    
    func fetchUsers()-> Single<[User]> {
        return Single.create { [unowned self] single in
            userStorage.fetchUsers { result in
                do {
                    single(.success(try result.get()))
                } catch {
                    single(.failure(error))
                }
            }
            
            return Disposables.create()
        }
    }
}
