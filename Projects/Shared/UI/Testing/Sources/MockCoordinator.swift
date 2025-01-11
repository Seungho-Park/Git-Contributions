//
//  MockCoordinator.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUIInterface

public struct MockCoordinator: Coordinator {
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let vc = MockViewController(controllerId: 1)
        navigationController.pushViewController(vc, animated: false)
    }
}
