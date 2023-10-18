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
}

protocol LoginUsecase {
    func login(type: VCSType, host: String?, username: String, token: String?)-> Single<Profile>
}

class LoginUsecaseImpl: LoginUsecase {
    let profileRepository: ProfileRepository
    let tokenRepository: TokenRepository
    
    init(profileRepository: ProfileRepository, tokenRepository: TokenRepository) {
        self.profileRepository = profileRepository
        self.tokenRepository = tokenRepository
    }
    
    func login(type: VCSType, host: String?, username: String, token: String? = nil)-> Single<Profile> {
        Single.create { [unowned self] single in
            if type == .gitlab {
                if host == nil {
                    single(.failure(LoginError.invalidHost))
                }
            }
            let task = self.profileRepository.fetchProfile(profile: .init(id: -1, type: type, host: host, username: username, homepageURL: "", name: "", avatarImageURL: ""))
            return Disposables.create { task?.cancel() }
        }
    }
}
