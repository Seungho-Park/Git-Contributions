//
//  AppDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation

final class AppDIContainer {
    
    private lazy var apiDataTransferService: DataTransferService = {
        let networkService = NetworkService()
        return DataTransferServiceImpl(networkService: networkService)
    }()
    
    
    func makeSplashViewModel(actions: SplashViewModel.SplashViewModelAction)-> SplashViewModel {
        .init(title: "Splash", actions: actions, splashUsecase: makeSplashUsecase())
    }
    
    private func makeSplashUsecase()-> SplashUsecase {
        return SplashUsecaseImpl(profileRepository: makeProfileRepository())
    }
    
    private func makeProfileRepository()-> ProfileRepository {
        return ProfileRepositoryImpl(dataTransferService: apiDataTransferService)
    }
    
    func makeLoginSceneDIContainer()-> LoginSceneDIContainer {
        return LoginSceneDIContainer(apiDataTransferService: apiDataTransferService)
    }
}
