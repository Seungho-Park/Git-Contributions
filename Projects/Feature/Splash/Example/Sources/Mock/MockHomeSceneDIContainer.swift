//
//  MockHomeSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface

struct MockHomeSceneDIContainerDependencies {
    
}

final class MockHomeSceneDIContainer: DIContainer {
    let dependencies: MockHomeSceneDIContainerDependencies
    
    init(dependencies: MockHomeSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    func makeCoordinator(navigationController: UINavigationController) -> some Coordinator {
        return MockHomeSceneCoordinator(navigationController: navigationController)
    }
}
