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

final class AppDIContainer {
    lazy var coreDataStorage: CoreDataStorage = DefaultCoreDataStorage.shared
    lazy var apiDataTransferSerivce: CoreNetworkInterface.DataTransferService = DataTransferService(service: NetworkService())
    
    func makeSplashSceneDIContainer()-> SplashSceneDIContainer {
        return SplashSceneDIContainer(
            dependencies: .init(coreDataStorage: coreDataStorage, apiDataTransferService: apiDataTransferSerivce)
        )
    }
}
