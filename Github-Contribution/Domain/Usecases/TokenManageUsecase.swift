//
//  TokenManageUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/21/23.
//

import Foundation

protocol TokenManageUsecase {
    
}

class TokenManageUsecaseImpl: TokenManageUsecase {
    let repository: TokenRepository
    
    init(repository: TokenRepository) {
        self.repository = repository
    }
}
