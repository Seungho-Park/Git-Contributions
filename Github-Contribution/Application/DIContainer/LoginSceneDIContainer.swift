//
//  LoginSceneDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation

class LoginSceneDIContainer {
    
    func makeLoginSceneCoordinator()-> LoginSceneCoordinator {
        return LoginSceneCoordinator(diContainer: self)
    }
}
