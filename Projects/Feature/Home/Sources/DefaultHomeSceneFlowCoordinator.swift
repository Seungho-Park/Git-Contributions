//
//  DefaultHomeSceneFlowCoordinator.swift
//  FeatureHome
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface
import FeatureHomeInterface

public final class DefaultHomeSceneFlowCoordinator: HomeSceneFlowCoordinator {
    public var navigationController: UINavigationController
    private let dependencies: HomeSceneFlowCoordinatorDependencies
    
    public init(navigationController: UINavigationController, dependencies: HomeSceneFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        
    }
}
