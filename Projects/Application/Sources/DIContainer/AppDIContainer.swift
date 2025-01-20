//
//  AppDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import CoreStorageInterface
import CoreStorage
import CoreNetwork
import CoreNetworkInterface
import FeatureSplash
import FeatureSplashInterface

final class AppDIContainer {
    var coreDataStorage: CoreDataStorage = DefaultCoreDataStorage.shared
    lazy var apiDataTransferSerivce: CoreNetworkInterface.DataTransferService = DefaultDataTransferService(service: DefaultNetworkService())
    
    func makeSplashSceneDIContainer()-> SplashSceneDIContainer {
        return DefaultSplashSceneDIContainer(
            dependencies: .init(storage: coreDataStorage, apiDataTransferService: apiDataTransferSerivce)
        )
    }
}
