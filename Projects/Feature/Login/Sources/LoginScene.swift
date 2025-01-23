//
//  LoginScene.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import FeatureLoginInterface
import SharedUIInterface

public enum LoginScene: Scene {
    case login(any LoginViewModel)
    
    public func instaintiate() -> UIViewController {
        switch self {
        case .login(let viewModel):
            return LoginViewController.create(viewModel: viewModel as! DefaultLoginViewModel)
        }
    }
}
