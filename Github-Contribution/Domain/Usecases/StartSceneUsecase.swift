//
//  StartSceneUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import RxSwift

protocol StartSceneUsecase {
    func fetchProfiles()-> Observable<[Profile]>
}

class StartSceneUsecaseImpl: StartSceneUsecase {
    private let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func fetchProfiles() -> Observable<[Profile]> {
        Observable.create { [unowned self] observer in
            self.repository
                .fetchAccounts { result in
                    switch result {
                    case .success(let profiles):
                        observer.onNext(profiles)
                        observer.onCompleted()
                    case .failure(let error): 
                        observer.onError(error)
                    }
                }
            
            return Disposables.create()
        }
    }
}
