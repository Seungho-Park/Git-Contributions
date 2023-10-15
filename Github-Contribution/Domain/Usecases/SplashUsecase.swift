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
    func checkLogin()-> Observable<Bool>
}

class SplashUsecaseImpl: SplashUsecase {
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func checkLogin() -> Observable<Bool> {
        Observable<Bool>.create { [unowned self] observer in
            self.profileRepository.fetchUserInfos { result in
                observer.onNext(((try? result.get())?.count ?? 0) > 0)
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
}
