//
//  StartViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

extension StartViewModel {
    struct Actions {
        let showSelectPlatform: ()-> Void
    }
    
    struct Input {
        let touchedStartButton: Observable<Void>
    }
    
    struct Output {
        
    }
}

class StartViewModel: NSObject, ViewModel {
    private let usecase: StartSceneUsecase
    var title: Driver<String>
    let actions: Actions
    
    init(title: String = "", usecase: StartSceneUsecase, actions: Actions) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "Get Started".localized)
        self.usecase = usecase
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.touchedStartButton
            .subscribe { [unowned self] _ in
                self.actions.showSelectPlatform()
            }.disposed(by: rx.disposeBag)
        return .init()
    }
}
