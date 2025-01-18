//
//  SplashViewModelImpl.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import FeatureSplashInterface

extension SplashViewModelImpl: SplashViewModel {
    public func transform(input: SplashViewModelInput) -> SplashViewModelOutput {
        return .init()
    }
}

public class SplashViewModelImpl {
    private let actions: SplashViewModelActions
    
    public init(actions: SplashViewModelActions) {
        self.actions = actions
    }
}
