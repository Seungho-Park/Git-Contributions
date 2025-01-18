//
//  SplashSceneFlowCoordinator.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//

import SharedUIInterface
import FeatureSplashInterface
import UIKit

public protocol SplashSceneFlowCoordinatorDependencies {
    func makeSplashViewModel(actions: SplashViewModelActions)-> any SplashViewModel
}

final public class SplashSceneFlowCoordinator: Coordinator {
    public let navigationController: UINavigationController
    private let dependencies: SplashSceneFlowCoordinatorDependencies
    
    public init(navigationController: UINavigationController, dependencies: SplashSceneFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        transition(scene: SplashScene.splash(dependencies.makeSplashViewModel(actions: self) as! SplashViewModelImpl), style: .root)
    }
}

extension SplashSceneFlowCoordinator: SplashViewModelActions {
    
}
