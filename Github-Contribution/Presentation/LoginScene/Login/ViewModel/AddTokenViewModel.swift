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
        
    }
    
    struct Output {
        
    }
}

class AddTokenViewModel: NSObject, ViewModel {
    
    var title: Driver<String>
    let type: VCSType
    let host: String?
    
    init(title: String = "Add Token".localized, type: VCSType, host: String? = nil) {
        self.title = Observable<String>.just(title).asDriver(onErrorJustReturn: "")
        self.type = type
        self.host = host
    }
    
    func transform(_ input: Input) -> Output {
        .init()
    }
}
