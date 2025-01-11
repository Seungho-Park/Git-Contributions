//
//  SplashSceneDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import FeatureSplashInterface
import FeatureSplash

final class SplashSceneDIContainer {
    func makeSplashSceneFlowCoordinator(navController: UINavigationController)-> SplashSceneFlowCoordinator {
        return SplashSceneFlowCoordinator(navigationController: navController, dependencies: self)
    }
}

extension SplashSceneDIContainer: SplashSceneFlowCoordinatorDependencies {
    func makeSplashViewModel(actions: SplashViewModelActions) -> FeatureSplash.SplashViewModel {
        return .init(actions: actions)
    }
}
