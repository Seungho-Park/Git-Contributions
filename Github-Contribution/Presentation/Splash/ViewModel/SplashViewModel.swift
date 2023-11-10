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
    
    init(title: String) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    }
    
    func transform(_ input: Input) -> Output {
        
        
        return Output(
            
        )
    }
}
