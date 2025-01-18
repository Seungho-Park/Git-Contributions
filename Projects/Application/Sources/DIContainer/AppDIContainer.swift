//
//  AppDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import CoreStorage
import CoreStorageInterface
import CoreNetwork
import CoreNetworkInterface
import FeatureSplash
import FeatureSplashInterface

final class AppDIContainer {
    lazy var coreDataStorage: CoreDataStorage = DefaultCoreDataStorage.shared
    lazy var apiDataTransferSerivce: CoreNetworkInterface.DataTransferService = DefaultDataTransferService(service: DefaultNetworkService())
    
    func makeSplashSceneDIContainer()-> SplashSceneDIContainer {
        return SplashSceneDIContainer(
            dependencies: .init(coreDataStorage: coreDataStorage, apiDataTransferService: apiDataTransferSerivce)
        )
    }
}
