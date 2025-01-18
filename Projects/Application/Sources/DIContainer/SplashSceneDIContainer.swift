//
//  SplashSceneDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import FeatureSplashInterface
import FeatureSplash
import CoreStorageInterface
import CoreNetworkInterface

final class SplashSceneDIContainer {
    struct Dependencies {
        let coreDataStorage: CoreDataStorage
        let apiDataTransferService: DataTransferService
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeSplashSceneFlowCoordinator(navController: UINavigationController)-> SplashSceneFlowCoordinator {
        return SplashSceneFlowCoordinator(navigationController: navController, dependencies: self)
    }
}

extension SplashSceneDIContainer: SplashSceneFlowCoordinatorDependencies {
    func makeSplashViewModel(actions: SplashViewModelActions) -> any SplashViewModel {
        return SplashViewModelImpl(actions: actions)
    }
}
