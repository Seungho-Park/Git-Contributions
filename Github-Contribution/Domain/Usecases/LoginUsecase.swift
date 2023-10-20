//
//  LoginUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/18/23.
//

import Foundation
import RxSwift
import RxCocoa

enum LoginError: Error {
    case invalidHost
    case tokenNil
}

protocol LoginUsecase {
    func login(type: VCSType, host: String?, username: String, token: String?)
}

class LoginUsecaseImpl: LoginUsecase {
    let profileRepository: ProfileRepository
    let tokenRepository: TokenRepository
    
    init(profileRepository: ProfileRepository, tokenRepository: TokenRepository) {
        self.profileRepository = profileRepository
        self.tokenRepository = tokenRepository
    }
    
    func login(type: VCSType, host: String?, username: String, token: String? = nil) {
        
    }
}
