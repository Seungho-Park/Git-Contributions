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
    struct Actions {
        let showTokenScene: (VCSType, String?)-> Void
        let showAlert: (String)-> Void
    }
    
    struct Input {
        let tapToken: Observable<Void>
        let tapSubmit: Observable<Void>
    }
    
    struct Output {
        let vcsType: Driver<VCSType>
    }
}

class LoginViewModel: NSObject, ViewModel {
    var title: Driver<String>
    let vcsType: BehaviorRelay<VCSType>
    
    let actions: Actions
    
    init(title: String = "Login".localized, type: VCSType, actions: Actions) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.vcsType = BehaviorRelay(value: type)
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.tapToken.subscribe { [unowned self] _ in
            self.actions.showTokenScene(self.vcsType.value, "")
        }.disposed(by: rx.disposeBag)
        
        input.tapSubmit.subscribe { [unowned self] _ in
            //TODO: Profile 조회 API를 통해 올바른 계정인지 확인, 올바른 계정일 경우 main화면으로 이동, 아니면 알람창 띄우기.
            self.actions.showAlert("Invalid information Alert".localized)
        }.disposed(by: rx.disposeBag)
        
        return Output(
            vcsType: self.vcsType.asDriver()
        )
    }
}
