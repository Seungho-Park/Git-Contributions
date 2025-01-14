//
//  AppDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import CoreStorage
import CoreStorageInterface

final class AppDIContainer {
    lazy var coreDataStorage: CoreDataStorage = DefaultCoreDataStorage.shared
    
    func makeSplashSceneDIContainer()-> SplashSceneDIContainer {
        return SplashSceneDIContainer(dependencies: .init())
    }
}
