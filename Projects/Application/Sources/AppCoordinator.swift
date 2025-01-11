//
//  AppCoordinator.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUIInterface

final class AppCoordinator: Coordinator {
    private let diContainer: AppDIContainer
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let diContainer = diContainer.makeSplashSceneDIContainer()
        let coordinator = diContainer.makeSplashSceneFlowCoordinator(navController: navigationController)
        coordinator.start()
    }
}
