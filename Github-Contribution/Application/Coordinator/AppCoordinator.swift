//
//  AppCoordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var window: UIWindow
    var navigationController: UINavigationController
    let diContainer: AppDIContainer
    
    init(window: UIWindow, diContainer: AppDIContainer) {
        self.window = window
        self.navigationController = UINavigationController()
        self.diContainer = diContainer
    }
    
    func start() {
        let scene = AppScene.splash(diContainer.makeSplashViewModel())
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        navigationController.pushViewController(scene.instantiate(), animated: false)
    }
}
