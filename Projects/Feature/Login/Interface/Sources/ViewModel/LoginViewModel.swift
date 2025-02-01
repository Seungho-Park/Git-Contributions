//
//  LoginViewModel.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import SharedUIInterface
import RxSwift

public struct LoginViewModelActions {
    public let showSelectPlatform: ()-> Void
    
    public init(
        showSelectPlatform: @escaping ()-> Void
    ) {
        self.showSelectPlatform = showSelectPlatform
    }
    
}

public struct LoginViewModelInput {
    public let tapStartButton: Observable<Void>
    
    public init(tapStartButton: Observable<Void>) {
        self.tapStartButton = tapStartButton
    }
}

public struct LoginViewModelOutput {
    
    public init() {
        
    }
}

public protocol LoginViewModel: ViewModel where Input == LoginViewModelInput, Output == LoginViewModelOutput {
    
}
