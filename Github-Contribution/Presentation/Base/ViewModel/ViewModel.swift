//
//  ViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModel: NSObject {
    associatedtype Input
    associatedtype Output
    
    var backgroundColor: Driver<String> { get }
    var title: Driver<String> { get }
    
    func transform(_ input: Input)-> Output
}

extension ViewModel {
    var backgroundColor: Driver<String> {
        return Observable<String>.just("BackgroundVC").asDriver(onErrorJustReturn: "")
    }
}
