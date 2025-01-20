//
//  SplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import CoreStorageInterface
import CoreNetworkInterface

public struct SplashSceneDIContainerDependencies {
    public let storage: CoreDataStorage
    public let apiDataTransferService: DataTransferService
    
    public init(storage: CoreDataStorage, apiDataTransferService: DataTransferService) {
        self.storage = storage
        self.apiDataTransferService = apiDataTransferService
    }
}

public protocol SplashSceneDIContainer: SplashSceneFlowCoordinatorDependencies {
    var dependencies: SplashSceneDIContainerDependencies { get }
    
    func makeSplashSceneFlowCoordinator(navigationController: UINavigationController)-> SplashSceneFlowCoordinator
}
