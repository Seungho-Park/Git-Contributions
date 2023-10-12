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
                        showSelectPlatform: showSelectPlatform
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
                        dismiss: closePlatformVC,
                        showLogin: showLoginScene(type:)
                    )
                )
            ),
            transitionStyle: .modal,
            animated: false
        )
    }
    
    private func showLoginScene(type: VCSType) {
        close() { [unowned self] in
            self.transition(
                scene: LoginScene.login(
                    self.diContainer.makeLoginViewModel(
                        type: type,
                        actions: .init(
                            showTokenScene: showTokenScene(type:host:)
                        )
                    )
                ),
                transitionStyle: .push
            )
        }
        
    }
    
    private func showTokenScene(type: VCSType, host: String?) {
        transition(
            scene: LoginScene.tokenManagement(
                diContainer.makeTokenManagementViewModel()
            ),
            transitionStyle: .push
        )
    }
    
    private func closePlatformVC() {
        close(animated: true)
    }
}
