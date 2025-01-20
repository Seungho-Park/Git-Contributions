//
//  MockSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import FeatureSplashInterface

public struct MockSplashSceneDIContainer: SplashSceneDIContainer {
    public var dependencies: FeatureSplashInterface.SplashSceneDIContainerDependencies
    
    public func makeSplashSceneFlowCoordinator(navigationController: UINavigationController) -> any FeatureSplashInterface.SplashSceneFlowCoordinator {
        return MockSplashSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    public func makeSplashViewModel(actions: FeatureSplashInterface.SplashViewModelActions) -> any SplashViewModel {
        return MockSplashViewModel()
    }
}
