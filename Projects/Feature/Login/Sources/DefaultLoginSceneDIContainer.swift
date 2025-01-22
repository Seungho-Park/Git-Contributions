//
//  DefaultLoginSceneDIContainer.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface
import FeatureLoginInterface

public final class DefaultLoginSceneDIContainer: LoginSceneDIContainer, LoginSceneFlowCoordinatorDependencies {
    public let dependencies: LoginSceneDIContainerDependencies
    
    public init(dependencies: LoginSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    public func makeCoordinator(navigationController: UINavigationController) -> any Coordinator {
        return DefaultLoginSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
