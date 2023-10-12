//
//  LoginScene.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit

enum LoginScene: Scene {
    case platform(PlatformViewModel)
    case login(LoginViewModel)
    case tokenManagement(TokenManagementViewModel)
    
    func instantiate() -> UIViewController {
        switch self {
        case .platform(let viewModel): 
            let vc = PlatformViewController.create(viewModel: viewModel)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            return vc
        case .login(let viewModel):
            return LoginViewController.create(viewModel: viewModel)
        case .tokenManagement(let viewModel):
            return TokenManagementViewController.create(viewModel: viewModel)
        }
    }
}
