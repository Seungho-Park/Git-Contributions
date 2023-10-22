//
//  SplashUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol SplashUsecase {
    func checkLogin()-> Signal<Bool>
}

class SplashUsecaseImpl: SplashUsecase {
    private let profileRepository: ProfileRepository
    private let tokenRepository: TokenRepository
    
    init(profileRepository: ProfileRepository, tokenRepository: TokenRepository) {
        self.profileRepository = profileRepository
        self.tokenRepository = tokenRepository
    }
    
    func checkLogin()-> Signal<Bool> {
        tokenRepository.fetchAll()
        return profileRepository.fetchUsers().map { $0.count > 0 }.asSignal(onErrorJustReturn: false)
    }
}
