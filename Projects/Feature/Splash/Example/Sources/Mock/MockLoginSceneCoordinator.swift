//
//  MockLoginSceneCoordinator.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import SharedUIInterface

final class MockLoginSceneCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let alertController = UIAlertController(title: "알림", message: "LoginScene입니다.", preferredStyle: .alert)
        alertController.addAction(.init(title: "확인", style: .default))
        (navigationController.topViewController ?? navigationController).present(alertController, animated: true)
    }
}
