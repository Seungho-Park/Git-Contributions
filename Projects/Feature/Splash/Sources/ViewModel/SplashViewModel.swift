//
//  SplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import FeatureSplashInterface

extension SplashViewModel: FeatureSplashInterface.SplashViewModel {
    public struct Input {
        
    }
    
    public struct Output {
        
    }
    
    public func transform(input: Input) -> Output {
        return .init()
    }
}

public class SplashViewModel {
    public let actions: SplashViewModelActions
    
    public init(actions: SplashViewModelActions) {
        self.actions = actions
    }
}
