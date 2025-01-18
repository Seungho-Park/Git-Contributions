//
//  DefaultSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import FeatureSplashInterface
import CoreStorageInterface
import CoreNetworkInterface

final
public class DefaultSplashSceneDIContainer: SplashSceneDIContainer {
    public struct Dependencies {
        let coreDataStorage: CoreDataStorage
        let apiDataTransferService: DataTransferService
        
        public init(coreDataStorage: CoreDataStorage, apiDataTransferService: DataTransferService) {
            self.coreDataStorage = coreDataStorage
            self.apiDataTransferService = apiDataTransferService
        }
    }
    
    private let dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public func makeSplashSceneFlowCoordinator(navController: UINavigationController)-> SplashSceneFlowCoordinator {
        return SplashSceneFlowCoordinator(navigationController: navController, dependencies: self)
    }
}

extension DefaultSplashSceneDIContainer: SplashSceneFlowCoordinatorDependencies {
    public func makeSplashViewModel(actions: SplashViewModelActions) -> any SplashViewModel {
        return SplashViewModelImpl(actions: actions)
    }
}
