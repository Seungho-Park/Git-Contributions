//
//  LoginViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: NSObject, ViewModel {
    struct Input {
        
    }
    
    struct Output {
        let vcsType: Driver<VCSType>
    }
    
    var title: Driver<String>
    let vcsType: BehaviorRelay<VCSType>
    
    init(title: String = "Login".localized, type: VCSType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.vcsType = BehaviorRelay(value: type)
    }
    
    func transform(_ input: Input) -> Output {
        return Output(
            vcsType: self.vcsType.asDriver()
        )
    }
}
