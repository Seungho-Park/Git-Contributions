//
//  LoginCoordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit

final class LoginSceneCoordinator: Coordinator {
    
    var window: UIWindow?
    var rootViewController: UIViewController?
    var diContainer: LoginSceneDIContainer
    
    init(window: UIWindow?, diContainer: LoginSceneDIContainer) {
        self.window = window
        self.rootViewController = UINavigationController.init()
        self.diContainer = diContainer
    }
    
    func start() {
        transition(
            scene: AppScene.login(
                diContainer.makeStartViewModel(
                    actions: StartViewModel.Actions(
                        showSelectPlatform: showSelectPlatform,
                        showLoginScene: showLoginScene
                    )
                )
            ),
            transitionStyle: .root
        )
    }
    
    private func showSelectPlatform() {
        transition(
            scene: LoginScene.platform(
                diContainer.makePlatformViewModel(
                    actions: PlatformViewModel.Actions(
                        dismiss: closePlatformVC
                    )
                )
            ),
            transitionStyle: .modal,
            animated: false
        )
    }
    
    private func showLoginScene() {
        
    }
    
    private func closePlatformVC() {
        close(animated: true)
    }
}