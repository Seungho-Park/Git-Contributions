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
                        dismiss: close,
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
                            showTokenScene: showTokenScene(type:host:),
                            showAlert: showAlert(msg:)
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
                diContainer.makeTokenManagementViewModel(
                    type: type,
                    host: host,
                    actions: .init(
                        showAddToken: showAddToken(type:host:)
                    )
                )
            ),
            transitionStyle: .push
        )
    }
    
    private func showAddToken(type: VCSType, host: String?) {
        transition(
            scene: LoginScene.addToken(
                diContainer.makeAddTokenViewModel(
                    type: type,
                    host: host,
                    actions: .init(
                        showAlert: showAlert(msg:)
                    )
                )
            ),
            transitionStyle: .push
        )
    }
    
    private func showAlert(msg: String) {
        transition(scene: AppScene.alert(msg), transitionStyle: .modal)
    }
    
    private func close() {
        close(animated: true)
    }
}
