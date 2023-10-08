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

class SplashViewModel: NSObject, ViewModel {
    struct SplashViewModelAction {
        let showLoginScene: ()-> Void
        let showMainScene: ()-> Void
    }
    
    struct Input {
        let viewDidAppear: Observable<Bool>
    }
    
    struct Output {
        
    }
    
    var title: Driver<String>
    private let actions: SplashViewModelAction
    
    init(title: String, actions: SplashViewModelAction) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.viewDidAppear
            .subscribe { [unowned self] event in
                guard let isLoad = event.element, isLoad else { return }
                //처음 사용인지 로그인 정보가 있는 사용자인지 체크
                //처음 사용자면 로그인 화면으로, 아니라면 로그인 정보 불러온 뒤 메인 화면으로
                
                self.actions.showLoginScene()
            }.disposed(by: rx.disposeBag)
        
        return Output(
            
        )
    }
}
