//
//  DefaultSplashSceneDIContainer.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import SharedUIInterface
import FeatureSplashInterface
import CoreNetworkInterface
import DomainUserInterface
import DomainUser

public final class DefaultSplashSceneDIContainer: SplashSceneDIContainer, SplashSceneFlowCoordinatorDependencies {
    public let dependencies: SplashSceneDIContainerDependencies
    
    public init(dependencies: SplashSceneDIContainerDependencies) {
        self.dependencies = dependencies
    }
    
    public func makeCoordinator(navigationController: UINavigationController) -> some SplashSceneFlowCoordinator {
        return DefaultSplashSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    public func makeSplashViewModel(actions: SplashViewModelActions) -> any SplashViewModel {
        return DefaultSplashViewModel(fetchUserListUsecase: makeFetchUserListUsecase(), actions: actions)
    }
    
    public func makeHomeSceneDIContainer() -> any DIContainer {
        return dependencies.homeSceneDIContainer()
    }
    
    public func makeLoginSceneDIContainer() -> any DIContainer {
        return dependencies.loginSceneDIContainer()
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
