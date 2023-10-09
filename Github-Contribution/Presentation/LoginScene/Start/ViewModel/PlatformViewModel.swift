//
//  PlatformViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

extension PlatformViewModel {
    struct Actions {
        let dismiss: ()-> Void
    }
    
    struct Input {
        let dismiss: Driver<Bool>
    }
    
    struct Output {
        
    }
}

class PlatformViewModel: NSObject, ViewModel {
    
    var title: Driver<String> = Observable.just("").asDriver(onErrorJustReturn: "")
    var backgroundColor: Driver<String> = Observable.just("bgPlatformVC").asDriver(onErrorJustReturn: "")
    let actions: Actions
    
    init(actions: Actions) {
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.dismiss
            .drive(onNext: { [unowned self] isDismiss in
                if !isDismiss { return }
                self.actions.dismiss()
            }).disposed(by: rx.disposeBag)
        return Output()
    }
}
