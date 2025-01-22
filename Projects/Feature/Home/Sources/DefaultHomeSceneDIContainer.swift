//
//  DefaultHomeSceneDIContainer.swift
//  FeatureHome
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface
import FeatureHomeInterface

public final class DefaultHomeSceneDIContainer: HomeSceneDIContainer, HomeSceneFlowCoordinatorDependencies {
    public var dependencies: HomeSceneDIContainerDependencies
    
    public init(dependencies: HomeSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    public func makeCoordinator(navigationController: UINavigationController) -> some HomeSceneFlowCoordinator {
        return DefaultHomeSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
