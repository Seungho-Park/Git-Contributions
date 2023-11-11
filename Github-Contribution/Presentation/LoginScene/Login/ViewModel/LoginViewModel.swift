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
        
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
}

class LoginViewModel: NSObject, ViewModel {
    
    var title: Driver<String>
    
    init(title: String = "Login".localized) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        
    }
    
    func transform(_ input: Input) -> Output {
        return Output(
            
        )
    }
}
