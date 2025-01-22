//
//  AppDIContainer.swift
//  Application
//
//  Created by 박승호 on 1/11/25.
//
import SharedUIInterface
import CoreStorageInterface
import CoreStorage
import CoreNetwork
import CoreNetworkInterface
import FeatureSplash
import FeatureSplashInterface
import FeatureLoginInterface
import FeatureHomeInterface

final class AppDIContainer {
    var coreDataStorage: CoreDataStorage = DefaultCoreDataStorage.shared
    lazy var apiDataTransferSerivce: CoreNetworkInterface.DataTransferService = DefaultDataTransferService(service: DefaultNetworkService())
    
    // any DIContainer로 반환하면 각 Feature들이 서로의 Interface를 참조하지 않아도 됨.
    func makeSplashSceneDIContainer()-> any DIContainer {
        return DefaultSplashSceneDIContainer(
            dependencies: .init(storage: coreDataStorage, apiDataTransferService: apiDataTransferSerivce)
        )
    }
    
//    func makeLoginSceneDIContainer()-> LoginSceneDIContainer {
//        
//    }
//    
//    func makeHomeSceneDIContainer()-> HomeSceneDIContainer {
//        
//    }
}
