//
//  LoginSceneDIContainer.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit

class LoginSceneDIContainer {
    struct Dependencies {
        let apiDataTransferService: DataTransferService
        let userStorage: UserStorage
        let tokenStorage: TokenStorage
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeLoginSceneCoordinator(window: UIWindow)-> LoginSceneCoordinator {
        return LoginSceneCoordinator(window: window, diContainer: self)
    }
    
    func makeStartViewModel(actions: StartViewModel.Actions)-> StartViewModel {
        return StartViewModel(usecase: makeStartSceneUsecase(), actions: actions)
    }
    
    func makePlatformViewModel(actions: PlatformViewModel.Actions)-> PlatformViewModel {
        return PlatformViewModel(actions: actions)
    }
    
    func makeLoginViewModel(type: VCSType, actions: LoginViewModel.Actions)-> LoginViewModel {
        return LoginViewModel(type: type, usecase: makeLoginUsecase(), actions: actions)
    }
    
    func makeTokenManagementViewModel(type: VCSType, host: String?, actions: TokenManagementViewModel.Actions)-> TokenManagementViewModel {
        return TokenManagementViewModel(type: type, host: host, usecase: makeTokenManageUsecase(), actions: actions)
    }
    
    func makeAddTokenViewModel(type: VCSType, host: String?, actions: AddTokenViewModel.Actions)-> AddTokenViewModel {
        return AddTokenViewModel(type: type, host: host, usecase: makeAddTokenUsecase(), actions: actions)
    }
    
    private func makeAddTokenUsecase()-> AddTokenUsecase {
        return AddTokenUsecaseImpl(tokenRepository: makeTokenRepository())
    }
    
    private func makeLoginUsecase()-> LoginUsecase {
        return LoginUsecaseImpl(profileRepository: makeProfileRepository(), tokenRepository: makeTokenRepository())
    }
    
    private func makeTokenManageUsecase()-> TokenManageUsecase {
        return TokenManageUsecaseImpl(repository: makeTokenRepository())
    }
    
    private func makeTokenRepository()-> TokenRepository {
        return TokenRepositoryImpl(tokenStorage: dependencies.tokenStorage)
    }
    
    private func makeStartSceneUsecase()-> StartSceneUsecase {
        return StartSceneUsecaseImpl()
    }
    
    private func makeProfileRepository()-> ProfileRepository {
        return ProfileRepositoryImpl(dataTransferService: dependencies.apiDataTransferService, userStorage: dependencies.userStorage)
    }
}
