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
    let type: VCSType
    let host: Driver<String>
    
    private let actions: Actions
    private let usecase: AddTokenUsecase
    
    init(title: String = "Add Token".localized, type: VCSType, host: String? = nil, usecase: AddTokenUsecase, actions: Actions) {
        self.title = Observable<String>.just(title).asDriver(onErrorJustReturn: "")
        self.type = type
        self.host = Observable.just(host ?? (type == .gitlab ? "https://gitlab.com" : "https://github.com")).asDriver(onErrorJustReturn: (type == .gitlab ? "https://gitlab.com" : "https://github.com"))
        self.usecase = usecase
        self.actions = actions
    }
    
    func transform(_ input: Input) -> Output {
        input.tapSubmit
            .subscribe { [weak self] event in
                guard let self = self, let _ = event.element else { return }
                
                guard let token = self.token, let note = self.note, !token.isEmpty, !note.isEmpty else {
                    self.actions.showAlert("Please insert Note And Token".localized)
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
            host: self.host
        )
    }
}
