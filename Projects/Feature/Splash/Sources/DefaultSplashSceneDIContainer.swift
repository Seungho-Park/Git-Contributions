//
//  DefaultSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import FeatureSplashInterface
import SharedStorageInterface
import CoreNetworkInterface

public struct DefaultSplashSceneDIContainer: SplashSceneDIContainer {
    public let dependencies: SplashSceneDIContainerDependencies
    
    public init(dependencies: SplashSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    public func makeSplashViewModel(actions: SplashViewModelActions) -> any SplashViewModel {
        return DefaultSplashViewModel(actions: actions)
    }
    
    public func makeSplashSceneFlowCoordinator(navigationController: UINavigationController) -> any SplashSceneFlowCoordinator {
        return DefaultSplashSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
