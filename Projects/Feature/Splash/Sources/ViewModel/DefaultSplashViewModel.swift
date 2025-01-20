//
//  DefaultSplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import FeatureSplashInterface

public class DefaultSplashViewModel: SplashViewModel {
    private let actions: SplashViewModelActions
    
    public init(actions: SplashViewModelActions) {
        self.actions = actions
    }
    
    public func transform(input: FeatureSplashInterface.SplashViewModelInput) -> FeatureSplashInterface.SplashViewModelOutput {
        return .init()
    }
}
