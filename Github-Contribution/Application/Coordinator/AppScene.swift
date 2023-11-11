//
//  AppScene.swift
//  Github-Contribution
//
//  Created by 박승호 on 11/11/23.
//

import Foundation
import UIKit

enum AppScene: Scene {
    case splash(SplashViewModel)
    case main
    case login
    
    func instantiate() -> UIViewController {
        switch self {
        case .splash(let viewModel): return SplashViewController.create(viewModel: viewModel)
        default: return .init()
        }
    }
}
