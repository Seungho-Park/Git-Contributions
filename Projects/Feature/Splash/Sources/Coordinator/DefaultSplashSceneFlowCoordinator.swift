//
//  DefaultSplashSceneFlowCoordinator.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import FeatureSplashInterface
import SharedUIInterface
import UIKit

public struct DefaultSplashSceneFlowCoordinator: SplashSceneFlowCoordinator {
    public let navigationController: UINavigationController
    private let dependencies: SplashSceneFlowCoordinatorDependencies
    
    public init(navigationController: UINavigationController, dependencies: SplashSceneFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        transition(scene: SplashScene.splash(dependencies.makeSplashViewModel(actions: .init())), style: .root)
    }
}
