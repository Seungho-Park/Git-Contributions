//
//  AppCoordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var window: UIWindow?
    var rootViewController: UINavigationController
    
    init(window: UIWindow, rootViewController: UINavigationController) {
        self.window = window
        self.rootViewController = rootViewController
    }
    
    func start() {
        
    }
}
