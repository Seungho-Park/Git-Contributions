//
//  SplashSceneFlowCoordinator.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface
import FeatureHomeInterface

public protocol SplashSceneFlowCoordinatorDependencies {
    func makeLoginSceneDIContainer()-> any DIContainer
    func makeHomeSceneDIContainer()-> any HomeSceneDIContainer
    
    func makeSplashViewModel(actions: SplashViewModelActions)-> any SplashViewModel
}

public protocol SplashSceneFlowCoordinator: Coordinator {
    func showLoginScene()
    func showMainScene()
}
