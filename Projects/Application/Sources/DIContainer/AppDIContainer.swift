//
//  AppDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//

final class AppDIContainer {
    func makeSplashSceneDIContainer()-> SplashSceneDIContainer {
        return SplashSceneDIContainer(dependencies: .init())
    }
}
