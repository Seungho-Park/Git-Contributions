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
    struct Actions {
        let showAddToken: (VCSType, String?)-> Void
    }
    
    struct Input {
        let tapAddButton: Observable<Void>
    }
    
    struct Output {
        
    }
}

class TokenManagementViewModel: NSObject, ViewModel {
    let title: Driver<String>
    let type: VCSType
    let host: String?
    let usecase: TokenManageUsecase
    let actions: Actions
    
    init(title: String = "Manage Token".localized, type: VCSType, host: String? = nil, usecase: TokenManageUsecase, actions: Actions) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.type = type
        self.host = host
        self.usecase = usecase
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.tapAddButton
            .subscribe { event in
                guard let _ = event.element else { return }
                
                self.actions.showAddToken(self.type, self.host)
            }.disposed(by: rx.disposeBag)
        
        return Output()
    }
}
