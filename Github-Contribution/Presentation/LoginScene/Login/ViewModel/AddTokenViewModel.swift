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
    
    var title: Driver<String>
    let type: VCSType
    let host: Driver<String>
    
    init(title: String = "Add Token".localized, type: VCSType, host: String? = nil) {
        self.title = Observable<String>.just(title).asDriver(onErrorJustReturn: "")
        self.type = type
        self.host = Observable.just(host ?? "N/A").asDriver(onErrorJustReturn: "N/A")
    }
    
    func transform(_ input: Input) -> Output {
        input.tapSubmit
            .subscribe { event in
                guard let tap = event.element else { return }
                
            }.disposed(by: rx.disposeBag)
        
        input.token
            .subscribe { event in
                guard let token = event.element else { return }
                
                print(token)
            }.disposed(by: rx.disposeBag)
        
        input.note
            .subscribe { event in
                guard let note = event.element else { return }
                
                print(note)
            }.disposed(by: rx.disposeBag)
        return .init(
            host: self.host
        )
    }
}
