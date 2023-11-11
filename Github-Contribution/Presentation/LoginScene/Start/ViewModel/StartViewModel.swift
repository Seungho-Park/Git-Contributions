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
        
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
}

class StartViewModel: NSObject, ViewModel {
    var title: Driver<String>
    
    init(title: String = "") {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "Get Started".localized)
    }
    
    func transform(_ input: Input) -> Output {
        return .init()
    }
}
