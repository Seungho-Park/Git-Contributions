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
        
    }
    
    var title: Driver<String>
    
    init(title: String = "Login".localized, type: VCSType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    }
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
