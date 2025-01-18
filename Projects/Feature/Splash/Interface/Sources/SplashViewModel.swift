//
//  SplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//

import SharedUIInterface

public protocol SplashViewModelActions {
    
}

public struct SplashViewModelInput {
    
    public init() {  }
}

public struct SplashViewModelOutput {
    
    public init() {  }
}

public protocol SplashViewModel: ViewModel where Input == SplashViewModelInput, Output == SplashViewModelOutput {
    
}
