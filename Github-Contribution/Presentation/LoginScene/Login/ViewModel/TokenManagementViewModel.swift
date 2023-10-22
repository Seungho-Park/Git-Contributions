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
    struct Dependencies {
        let type: VCSType
        let host: String
        let actions: Actions
    }
    
    struct Actions {
        let showAddToken: (VCSType, String)-> Void
    }
    
    struct Input {
        let tapAddButton: Observable<Void>
    }
    
    struct Output {
        
    }
}

class TokenManagementViewModel: NSObject, ViewModel {
    private let usecase: TokenManageUsecase
    private let dependencies: Dependencies
    let title: Driver<String>
    
    init(title: String = "Manage Token".localized, usecase: TokenManageUsecase, dependencies: Dependencies) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.usecase = usecase
        self.dependencies = dependencies
    }
    
    func transform(_ input: Input) -> Output {
        input.tapAddButton
            .subscribe { event in
                guard let _ = event.element else { return }
                self.dependencies.actions.showAddToken(self.dependencies.type, self.dependencies.host)
            }.disposed(by: rx.disposeBag)
        
        return Output()
    }
}
