//
//  LoginFlowSceneCoordinator.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/21/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import SharedUIInterface

public protocol LoginSceneFlowCoordinatorDependencies {
    func makeLoginViewModel(actions: LoginViewModelActions)-> any LoginViewModel
    func makePlatformViewModel(actions: PlatformViewModelActions)-> any PlatformViewModel
}

public protocol LoginSceneFlowCoordinator: Coordinator {
    func showSelectPlatform()
}
