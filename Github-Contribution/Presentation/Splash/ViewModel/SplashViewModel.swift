//
//  SplashViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

extension SplashViewModel {
    struct SplashViewModelAction {
        let showLoginScene: ()-> Void
        let showMainScene: ()-> Void
    }
    
    struct Input {
        let viewDidAppear: Observable<Bool>
    }
    
    struct Output {
        
    }
}

class SplashViewModel: NSObject, ViewModel {
    var title: Driver<String>
    private let actions: SplashViewModelAction
    private let splashUsecase: SplashUsecase
    
    init(title: String, actions: SplashViewModelAction, splashUsecase: SplashUsecase) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.actions = actions
        self.splashUsecase = splashUsecase
    }
    
    func transform(_ input: Input) -> Output {
        input.viewDidAppear
            .subscribe { [unowned self] event in
                guard let isLoad = event.element, isLoad else { return }
                self.splashUsecase
                    .checkLogin()
                    .emit { isLogin in
                        if isLogin {
                            
                        } else {
                            self.actions.showLoginScene()
                        }
                    }.disposed(by: rx.disposeBag)
            }.disposed(by: rx.disposeBag)
        
        return Output(
            
        )
    }
}
