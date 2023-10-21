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
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func checkLogin()-> Signal<Bool> {
        profileRepository.fetchUsers().map { $0.count > 0 }.asSignal(onErrorJustReturn: false)
    }
}
