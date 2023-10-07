//
//  AppCoordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

final class AppCoordinator: NSObject, Coordinator {
    var window: UIWindow?
    var rootViewController: UINavigationController
    let diContainer: AppDIContainer
    
    init(window: UIWindow, rootViewController: UINavigationController, diContainer: AppDIContainer) {
        self.window = window
        self.rootViewController = rootViewController
        self.diContainer = diContainer
    }
    
    func start() {
        transition(scene: AppScene.splash(diContainer.makeSplashViewModel()), transitionStyle: .root)
    }
}
