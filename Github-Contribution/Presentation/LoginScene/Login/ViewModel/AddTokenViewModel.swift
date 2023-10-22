//
//  AddTokenViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/21/23.
//

import Foundation
import RxSwift
import RxCocoa

extension AddTokenViewModel {
    struct Dependencies {
        let type: VCSType
        let host: String
        let actions: Actions
    }
    
    struct Actions {
        let showAlert: (String)-> Void
    }
    
    struct Input {
        let tapSubmit: Observable<Void>
        let note: Observable<String?>
        let token: Observable<String?>
    }
    
    struct Output {
        let host: Driver<String>
    }
}

class AddTokenViewModel: NSObject, ViewModel {
    private var token: String? = nil
    private var note: String? = nil
    
    var title: Driver<String>
    
    private let dependencies: Dependencies
    private let usecase: AddTokenUsecase
    
    init(title: String = "Add Token".localized, usecase: AddTokenUsecase, dependencies: Dependencies) {
        self.title = Observable<String>.just(title).asDriver(onErrorJustReturn: "")
        self.usecase = usecase
        self.dependencies = dependencies
    }
    
    func transform(_ input: Input) -> Output {
        input.tapSubmit
            .subscribe { [weak self] event in
                guard let self = self, let _ = event.element else { return }
                
                guard let token = self.token, let note = self.note, !token.isEmpty, !note.isEmpty else {
                    self.dependencies.actions.showAlert("Please insert Note And Token".localized)
                    return
                }
            }.disposed(by: rx.disposeBag)
        
        input.token
            .subscribe { [weak self] event in
                guard let self = self, let token = event.element else { return }
                
                self.token = token
            }.disposed(by: rx.disposeBag)
        
        input.note
            .subscribe { [weak self] event in
                guard let self = self, let note = event.element else { return }
                
                self.note = note
            }.disposed(by: rx.disposeBag)
        
        return .init(
            host: Observable.just(self.dependencies.host).asDriver(onErrorJustReturn: "Invalid Host")
        )
    }
}
