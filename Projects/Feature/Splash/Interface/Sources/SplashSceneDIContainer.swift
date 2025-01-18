//
//  SplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/18/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface

public protocol SplashSceneDIContainer {
    associatedtype CoordinatorType: Coordinator
    
    func makeSplashSceneFlowCoordinator(navController: UINavigationController)-> CoordinatorType
}
