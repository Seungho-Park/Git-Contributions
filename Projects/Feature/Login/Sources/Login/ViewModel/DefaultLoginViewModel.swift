//
//  DefaultLoginViewModel.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import FeatureLoginInterface
import RxSwift

public final class DefaultLoginViewModel: LoginViewModel {
    private var disposeBag = DisposeBag()
    private let actions: LoginViewModelActions
    
    public init(actions: LoginViewModelActions) {
        self.actions = actions
    }
    
    public func transform(input: LoginViewModelInput) -> LoginViewModelOutput {
        input.tapStartButton
            .subscribe { _ in
                print("TapStart..")
            }.disposed(by: disposeBag)
        return .init()
    }
}
