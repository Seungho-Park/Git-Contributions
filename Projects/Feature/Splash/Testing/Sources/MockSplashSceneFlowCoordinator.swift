//
//  MockSplashSceneFlowCoordinator.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import FeatureSplashInterface

public struct MockSplashSceneFlowCoordinator: SplashSceneFlowCoordinator {
    public var navigationController: UINavigationController
    private let dependencies: SplashSceneFlowCoordinatorDependencies
    
    public init(navigationController: UINavigationController, dependencies: SplashSceneFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        dependencies.makeSplashViewModel(actions: .init())
    }
}
