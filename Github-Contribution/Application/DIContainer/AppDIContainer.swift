//
//  AppDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation

final class AppDIContainer {
    
    func makeSplashViewModel(actions: SplashViewModel.SplashViewModelAction)-> SplashViewModel {
        .init(title: "Splash", actions: actions)
    }
    
    func makeLoginSceneDIContainer()-> LoginSceneDIContainer {
        return LoginSceneDIContainer()
    }
}
