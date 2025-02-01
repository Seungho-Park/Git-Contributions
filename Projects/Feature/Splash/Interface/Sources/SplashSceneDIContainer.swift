//
//  SplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface
import FeatureHomeInterface
import CoreStorageInterface
import CoreNetworkInterface

public struct SplashSceneDIContainerDependencies {
    public let storage: CoreDataStorage
    public let apiDataTransferService: DataTransferService
    
    public let loginSceneDIContainer: ()-> any DIContainer
    public let homeSceneDIContainer: ()-> any HomeSceneDIContainer
    
    public init(
        storage: CoreDataStorage,
        apiDataTransferService: DataTransferService,
        loginSceneDIContainer: @escaping ()-> any DIContainer,
        homeSceneDIContainer: @escaping ()-> any HomeSceneDIContainer
    ) {
        self.storage = storage
        self.apiDataTransferService = apiDataTransferService
        self.loginSceneDIContainer = loginSceneDIContainer
        self.homeSceneDIContainer = homeSceneDIContainer
    }
}

public protocol SplashSceneDIContainer: DIContainer where Dependencies == SplashSceneDIContainerDependencies {
    
}
