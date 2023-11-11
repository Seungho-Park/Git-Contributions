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
    
    private lazy var tokenDataStorage: TokenStorage = {
        return CoreDataTokenStorage()
    }()
    
    private lazy var userDataStorage: UserStorage = {
        return CoreDataUserStorage()
    }()
    
    
    func makeSplashViewModel()-> SplashViewModel {
        .init(title: "Splash")
    }
    
    private func makeSplashUsecase()-> SplashUsecase {
        return SplashUsecaseImpl(profileRepository: makeProfileRepository(), tokenRepository: makeTokenRepository())
    }
    
    private func makeProfileRepository()-> ProfileRepository {
        return ProfileRepositoryImpl(dataTransferService: apiDataTransferService, userStorage: userDataStorage, tokenStorage: tokenDataStorage)
    }
    
    private func makeTokenRepository()-> TokenRepository {
        return TokenRepositoryImpl(tokenStorage: tokenDataStorage)
    }
}
