//
//  AppScene.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import UIKit

enum AppScene: Scene {
    case splash(SplashViewModel)
    
    func instantiate() -> UIViewController {
        switch self {
        case .splash(let viewModel):
            return SplashViewController.create(viewModel: viewModel)
        }
    }
}
