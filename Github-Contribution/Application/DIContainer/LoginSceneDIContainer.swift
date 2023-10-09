//
//  LoginSceneDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit

class LoginSceneDIContainer {
    
    func makeLoginSceneCoordinator(window: UIWindow)-> LoginSceneCoordinator {
        return LoginSceneCoordinator(window: window, diContainer: self)
    }
    
    func makeStartViewModel(actions: StartViewModel.Actions)-> StartViewModel {
        return StartViewModel(actions: actions)
    }
    
    func makePlatformViewModel(actions: PlatformViewModel.Actions)-> PlatformViewModel {
        return PlatformViewModel(actions: actions)
    }
}
