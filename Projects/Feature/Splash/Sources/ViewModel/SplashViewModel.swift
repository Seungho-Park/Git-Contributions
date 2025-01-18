//
//  SplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import SharedUIInterface

extension SplashViewModel: ViewModel {
    public struct Actions {
        
    }
    
    public struct Input {
        
    }
    
    public struct Output {
        
    }
    
    public func transform(input: Input) -> Output {
        return .init()
    }
}

public class SplashViewModel {
    private let actions: Actions
    
    public init(actions: Actions) {
        self.actions = actions
    }
}
