//
//  AppDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation

final class AppDIContainer {
    
    func makeSplashViewModel()-> SplashViewModel {
        .init(title: "Splash")
    }
    
    func makeLoginSceneDIContainer()-> LoginSceneDIContainer {
        return LoginSceneDIContainer()
    }
}
