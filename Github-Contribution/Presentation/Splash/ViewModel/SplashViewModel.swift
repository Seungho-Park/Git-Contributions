//
//  SplashViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import RxSwift
import RxCocoa

class SplashViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        let isLogin: Observable<Bool>
    }
    
    var title: Driver<String>
    
    init(title: String) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    }
    
    func transform(_ input: Input) -> Output {
        return Output(
            isLogin: Observable<Bool>.just(false)
        )
    }
}
