//
//  SplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//

import SharedUIInterface

public protocol SplashViewModelActions {
    
}

public protocol SplashViewModel: ViewModel {
    var actions: SplashViewModelActions { get }
}
