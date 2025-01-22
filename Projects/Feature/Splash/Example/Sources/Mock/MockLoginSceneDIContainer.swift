//
//  MockLoginSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface

struct MockLoginSceneDIContainerDependencies {
    
}

final class MockLoginSceneDIContainer: DIContainer {
    let dependencies: MockLoginSceneDIContainerDependencies
    
    init(dependencies: MockLoginSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    func makeCoordinator(navigationController: UINavigationController) -> some Coordinator {
        return MockLoginSceneCoordinator(navigationController: navigationController)
    }
}
