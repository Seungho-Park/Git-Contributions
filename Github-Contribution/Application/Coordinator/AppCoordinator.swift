//
//  AppCoordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var window: UIWindow?
    var rootViewController: UIViewController? = nil
    let diContainer: AppDIContainer
    
    init(window: UIWindow, diContainer: AppDIContainer) {
        self.window = window
        self.diContainer = diContainer
    }
    
    func start() {
        transition(
            scene: AppScene.splash(
                diContainer.makeSplashViewModel(
                    actions: .init(
                        showLoginScene: showLoginScene,
                        showMainScene: showMainScene
                    )
                )
            ),
            transitionStyle: .root)
    }
    
    private func showLoginScene() {
        let loginDiContainer = diContainer.makeLoginSceneDIContainer()
        let coordinator = loginDiContainer.makeLoginSceneCoordinator(window: window!)
        coordinator.start()
    }
    
    private func showMainScene() {
        
    }
}