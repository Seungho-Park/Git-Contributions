//
//  HomeSceneFlowCoordinator.swift
//  FeatureHome
//
//  Created by 박승호 on 1/21/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

public struct HomeSceneDIContainerDependencies {
    
    public init() {
        
    }
}

public protocol HomeSceneDIContainer {
    var dependencies: HomeSceneDIContainerDependencies { get }
}
