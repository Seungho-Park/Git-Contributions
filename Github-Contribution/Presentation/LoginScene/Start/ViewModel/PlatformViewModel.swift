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
        
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
}

class PlatformViewModel: NSObject, ViewModel {
    var title: Driver<String>
    var backgroundColor: Driver<String>
    
    init(
        title: Driver<String> = Observable.just("").asDriver(onErrorJustReturn: ""),
        backgroundColor: Driver<String> = Observable.just("bgPlatformVC").asDriver(onErrorJustReturn: "")
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    func transform(_ input: Input) -> Output {
        
        return Output()
    }
}
