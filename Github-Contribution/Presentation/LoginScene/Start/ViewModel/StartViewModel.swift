//
//  StartViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import RxSwift
import RxCocoa

class StartViewModel: NSObject, ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    var title: Driver<String>
    
    init(title: String = "시작하기") {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "시작하기")
    }
    
    func transform(_ input: Input) -> Output {
        return .init()
    }
}
