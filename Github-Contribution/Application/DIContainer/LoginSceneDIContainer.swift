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
    
    func makeLoginViewModel(dependencies: LoginViewModel.Dependencies)-> LoginViewModel {
        return LoginViewModel(usecase: makeLoginUsecase(), dependencies: dependencies)
    }
    
    func makeTokenManagementViewModel(dependencies: TokenManagementViewModel.Dependencies)-> TokenManagementViewModel {
        return TokenManagementViewModel(usecase: makeTokenManageUsecase(), dependencies: dependencies)
    }
    
    func makeAddTokenViewModel(dependencies: AddTokenViewModel.Dependencies)-> AddTokenViewModel {
        return AddTokenViewModel(usecase: makeAddTokenUsecase(), dependencies: dependencies)
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
        return ProfileRepositoryImpl(dataTransferService: dependencies.apiDataTransferService, userStorage: dependencies.userStorage, tokenStorage: self.dependencies.tokenStorage)
    }
}
