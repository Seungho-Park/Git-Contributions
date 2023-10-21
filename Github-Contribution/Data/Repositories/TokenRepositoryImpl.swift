//
//  TokenRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/15/23.
//

import Foundation

class TokenRepositoryImpl: TokenRepository {
    let tokenStorage: TokenStorage
    
    init(tokenStorage: TokenStorage) {
        self.tokenStorage = tokenStorage
    }
    
    func fetchTokens(type: VCSType, host: String?, completion: @escaping (Result<[AccessToken], Error>)-> Void) {
        tokenStorage.fetchTokens(type: type, host: host, completion: completion)
    }
}
