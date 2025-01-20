//
//  DefaultSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import FeatureSplashInterface
import CoreNetworkInterface
import DomainUserInterface
import DomainUser

public struct DefaultSplashSceneDIContainer: SplashSceneDIContainer {
    public let dependencies: SplashSceneDIContainerDependencies
    
    public init(dependencies: SplashSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    public func makeSplashViewModel(actions: SplashViewModelActions) -> any SplashViewModel {
        return DefaultSplashViewModel(fetchUserListUsecase: makeFetchUserListUsecase(), actions: actions)
    }
    
    public func makeSplashSceneFlowCoordinator(navigationController: UINavigationController) -> any SplashSceneFlowCoordinator {
        return DefaultSplashSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}

//MARK: Usecase
extension DefaultSplashSceneDIContainer {
    func makeFetchUserListUsecase() -> FetchUserListUseCase {
        return FetchUserListUseCaseImpl(userRepository: makeUserRepository())
    }
}

//MARK: Repository
extension DefaultSplashSceneDIContainer {
    func makeUserRepository()-> UserRepository {
        return UserRepositoryImpl(storage: dependencies.storage)
    }
}
