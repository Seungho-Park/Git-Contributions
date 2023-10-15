//
//  TokenManagementViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import RxSwift
import RxCocoa

extension TokenManagementViewModel {
    struct Input {
        let tapAddButton: Observable<Void>
    }
    
    struct Output {
        
    }
}

class TokenManagementViewModel: NSObject, ViewModel {
    let title: Driver<String>
    
    init(title: String = "Manage Token".localized) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    }
    
    func transform(_ input: Input) -> Output {
        input.tapAddButton
            .subscribe { event in
                guard let ev = event.element else { return }
                
                print("Tap Add Button !")
            }.disposed(by: rx.disposeBag)
        
        return Output()
    }
}
