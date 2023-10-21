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
    func login(type: VCSType, host: String?, username: String, tokenId: Int)-> Single<Profile>
}

class LoginUsecaseImpl: LoginUsecase {
    let profileRepository: ProfileRepository
    let tokenRepository: TokenRepository
    
    init(profileRepository: ProfileRepository, tokenRepository: TokenRepository) {
        self.profileRepository = profileRepository
        self.tokenRepository = tokenRepository
    }
    
    func login(type: VCSType, host: String?, username: String, tokenId: Int = -1)-> Single<Profile> {
        return Single<Profile>.create { [unowned self] observer in
            var user: User = .init(type: type, host: host, username: username, token_id: tokenId)
            let task = self.profileRepository.fetchProfile(profile: user) { result in
                switch result {
                case .success(let profile): 
                    user.profile = profile
                    self.profileRepository.saveUser(user: user)
                    observer(.success(profile))
                case .failure(let error): observer(.failure(error))
                }
            }
            
            return Disposables.create { task?.cancel() }
        }
    }
}
