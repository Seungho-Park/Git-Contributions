//
//  TokenRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/15/23.
//

import Foundation
import RxSwift

class TokenRepositoryImpl: TokenRepository {
    let tokenStorage: TokenStorage
    
    init(tokenStorage: TokenStorage) {
        self.tokenStorage = tokenStorage
    }
    
    func fetchAll()-> Single<[AccessToken]> {
        return Single<[AccessToken]>.create { [weak self] single in
            guard let self = self else { return Disposables.create() }
            tokenStorage.fetchTokens { result in
                do {
                    single(.success(try result.get()))
                } catch {
                    single(.failure(error))
                }
            }
            
            return Disposables.create()
        }
    }
    
    func fetchTokens(type: VCSType, host: String?, completion: @escaping (Result<[AccessToken], Error>)-> Void) {
        tokenStorage.fetchTokens(completion: completion)
    }
    
    func saveToken(token: AccessToken)-> Single<AccessToken> {
        return Single<AccessToken>.create { [unowned self] single in
            tokenStorage.saveToken(token: token) { result in
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
