//
//  DefaultLoginSceneFlowCoordinator.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import UIKit
import FeatureLoginInterface
import SharedUIInterface

public final class DefaultLoginSceneFlowCoordinator: LoginSceneFlowCoordinator {
    public let navigationController: UINavigationController
    private let dependencies: LoginSceneFlowCoordinatorDependencies
    
    public init(navigationController: UINavigationController, dependencies: LoginSceneFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        transition(
            scene: LoginScene.login(
                dependencies.makeLoginViewModel(
                    actions: .init(
                        showSelectPlatform: showSelectPlatform
                    )
                )
            ),
            style: .root
        )
    }
    
    public func showSelectPlatform() {
        transition(scene: LoginScene.platform(dependencies.makePlatformViewModel(actions: .init())), style: .modal, animated: false)
    }
}
