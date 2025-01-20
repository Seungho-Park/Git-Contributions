//
//  SplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import SharedUIInterface
import DomainUserInterface
import SharedThirdPartyLibs

public struct SplashViewModelActions {
    
    public init() {
        
    }
}

public struct SplashViewModelInput {
    
    public init() {
        
    }
}

public struct SplashViewModelOutput {
    
    public init() {
        
    }
}

public protocol SplashViewModel: ViewModel where Input == SplashViewModelInput, Output == SplashViewModelOutput {
    func fetchUserList()-> Observable<[User]>
}
