//
//  LoginViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import RxSwift
import RxCocoa

extension LoginViewModel {
    struct Dependencies {
        let type: VCSType
        let actions: Actions
    }
    
    struct Actions {
        let showTokenScene: (VCSType, String?)-> Void
        let showAlert: (String)-> Void
    }
    
    struct Input {
        let tapToken: Observable<Void>
        let tapSubmit: Observable<Void>
        let host: Observable<String>
        let username: Observable<String>
        let token: Observable<String>
    }
    
    struct Output {
        let vcsType: Driver<VCSType>
    }
}

class LoginViewModel: NSObject, ViewModel {
    private let loginUsecase: LoginUsecase
    private let dependencies: Dependencies
    
    private var host: String = ""
    private var userName: String = ""
    private var tokenId: Int = -1
    
    var title: Driver<String>
    
    init(title: String = "Login".localized, usecase: LoginUsecase, dependencies: Dependencies) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.loginUsecase = usecase
        self.dependencies = dependencies
    }
    
    func transform(_ input: Input) -> Output {
        input.tapToken.subscribe { [unowned self] _ in
            self.dependencies.actions.showTokenScene(self.dependencies.type, host)
        }.disposed(by: rx.disposeBag)
        
        input.tapSubmit.subscribe { [unowned self] _ in
            //TODO: Profile 조회 API를 통해 올바른 계정인지 확인, 올바른 계정일 경우 main화면으로 이동, 아니면 알람창 띄우기.
            self.loginUsecase.login(type: dependencies.type, host: self.host, username: self.userName , tokenId: self.tokenId)
                .observe(on: MainScheduler.instance)
                .subscribe { result in
                    do {
                        let profile = try result.get()
                    } catch {
                        self.dependencies.actions.showAlert("Invalid information Alert".localized)
                    }
                }.disposed(by: rx.disposeBag)
        }.disposed(by: rx.disposeBag)
        
        input.host.subscribe { [unowned self] event in
            guard let host = event.element else { return }
            self.host = host
        }.disposed(by: rx.disposeBag)
        
        return Output(
            vcsType: Observable.just(dependencies.type).asDriver(onErrorJustReturn: .github)
        )
    }
}
