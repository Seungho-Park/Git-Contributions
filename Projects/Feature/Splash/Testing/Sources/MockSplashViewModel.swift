//
//  MockSplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import FeatureSplashInterface

public class MockSplashViewModel: SplashViewModel {
    public func transform(input: FeatureSplashInterface.SplashViewModelInput) -> FeatureSplashInterface.SplashViewModelOutput {
        return .init()
    }
}
