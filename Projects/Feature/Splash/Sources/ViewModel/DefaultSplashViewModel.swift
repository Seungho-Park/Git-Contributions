//
//  DefaultSplashViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import FeatureSplashInterface
import SharedThirdPartyLibs
import DomainUserInterface

public class DefaultSplashViewModel: SplashViewModel {
    private let actions: SplashViewModelActions
    private let fetchUserListUsecase: FetchUserListUseCase
    
    public init(fetchUserListUsecase: FetchUserListUseCase, actions: SplashViewModelActions) {
        self.fetchUserListUsecase = fetchUserListUsecase
        self.actions = actions
    }
    
    public func transform(input: FeatureSplashInterface.SplashViewModelInput) -> FeatureSplashInterface.SplashViewModelOutput {
        return .init()
    }
    
    public func fetchUserList() -> Observable<[User]> {
        fetchUserListUsecase.execute()
            .catchAndReturn([])
            .asObservable()
    }
}
