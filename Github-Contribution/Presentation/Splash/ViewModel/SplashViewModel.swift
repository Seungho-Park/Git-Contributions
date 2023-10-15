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
                //처음 사용인지 로그인 정보가 있는 사용자인지 체크
                //처음 사용자면 로그인 화면으로, 아니라면 로그인 정보 불러온 뒤 메인 화면으로
                self.splashUsecase.checkLogin()
                    .observe(on: MainScheduler.instance)
                    .subscribe { event in
                        guard let isRegister = event.element else { return }
                        
                        if isRegister {
                            //메인화면으로 이동
                        } else {
                            self.actions.showLoginScene()
                        }
                    }.disposed(by: rx.disposeBag)
            }.disposed(by: rx.disposeBag)
        
        return Output(
            
        )
    }
}
