//
//  GCTabBarViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import FeatureSplashInterface

final public class DefaultGCTabBarViewModel: GCTabBarViewModel {
    private let actions: GCTabBarViewModelActions
    
    public init(actions: GCTabBarViewModelActions) {
        self.actions = actions
    }
    
    public func transform(input: FeatureSplashInterface.GCTabBarViewModelInput) -> FeatureSplashInterface.GCTabBarViewModelOutput {
        
        return .init()
    }
}
