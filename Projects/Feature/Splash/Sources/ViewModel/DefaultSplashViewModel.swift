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
    private var disposeBag = DisposeBag()
    private let actions: SplashViewModelActions
    private let fetchUserListUsecase: FetchUserListUseCase
    
    public init(fetchUserListUsecase: FetchUserListUseCase, actions: SplashViewModelActions) {
        self.fetchUserListUsecase = fetchUserListUsecase
        self.actions = actions
    }
    
    public func transform(input: SplashViewModelInput) -> SplashViewModelOutput {
        let needLogin = input.viewDidAppear
            .withUnretained(self)
            .flatMap { owner, _ in
                owner.fetchUserList()
            }
            .map { $0.isEmpty }
            .share()
        
        needLogin
            .filter { !$0 }
            .map { _ in () }
            .bind(onNext: actions.showMainScene)
            .disposed(by: disposeBag)
        
        needLogin
            .filter { $0 }
            .map { _ in () }
            .bind(onNext: actions.showLoginScene)
            .disposed(by: disposeBag)
        
        return .init()
    }
    
    public func fetchUserList() -> Observable<[User]> {
        fetchUserListUsecase.execute()
            .catchAndReturn([])
            .asObservable()
    }
}
