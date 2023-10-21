//
//  AddTokenUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/22/23.
//

import Foundation

protocol AddTokenUsecase {
    func saveToken(type: VCSType, host: String, token: String)
}

class AddTokenUsecaseImpl: AddTokenUsecase {
    private let tokenRepository: TokenRepository
    
    init(tokenRepository: TokenRepository) {
        self.tokenRepository = tokenRepository
    }
    
    func saveToken(type: VCSType, host: String, token: String) {
        tokenRepository.saveToken(token: .init(id: -1, type: type, token: token, host: host))
    }
}
