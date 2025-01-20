//
//  MockSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import FeatureSplash
import FeatureSplashInterface

public struct MockSplashSceneDIContainer: SplashSceneDIContainer {
    public var dependencies: FeatureSplashInterface.SplashSceneDIContainerDependencies
    
    public func makeSplashSceneFlowCoordinator(navigationController: UINavigationController) -> any FeatureSplashInterface.SplashSceneFlowCoordinator {
        return DefaultSplashSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    public func makeSplashViewModel(actions: FeatureSplashInterface.SplashViewModelActions) -> any SplashViewModel {
        return DefaultSplashViewModel(actions: actions)
    }
}
