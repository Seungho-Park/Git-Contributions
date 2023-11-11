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
    private var token: String? = nil
    private var note: String? = nil
    
    var title: Driver<String>
    
    init(title: String = "Add Token".localized) {
        self.title = Observable<String>.just(title).asDriver(onErrorJustReturn: "")
    }
    
    func transform(_ input: Input) -> Output {
        return .init(
            
        )
    }
}
