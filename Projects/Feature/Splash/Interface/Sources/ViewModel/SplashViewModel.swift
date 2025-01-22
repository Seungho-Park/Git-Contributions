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
    public let showLoginScene: ()-> Void
    public let showMainScene: ()-> Void
    
    public init(showLoginScene: @escaping ()-> Void, showMainScene: @escaping ()-> Void) {
        self.showLoginScene = showLoginScene
        self.showMainScene = showMainScene
    }
}

public struct SplashViewModelInput {
    public let viewDidAppear: Observable<Bool>
    
    public init(viewDidAppear: Observable<Bool>) {
        self.viewDidAppear = viewDidAppear
    }
}

public struct SplashViewModelOutput {
    
    public init() {
        
    }
}

public protocol SplashViewModel: ViewModel where Input == SplashViewModelInput, Output == SplashViewModelOutput {
    func fetchUserList()-> Observable<[User]>
}
