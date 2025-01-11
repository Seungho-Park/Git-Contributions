//
//  SplashScene.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import SharedUIInterface

enum SplashScene: Scene {
    case splash(SplashViewModel)
    
    func instaintiate() -> UIViewController {
        switch self {
        case .splash(let viewModel):
            return SplashViewController.create(viewModel: viewModel)
        }
    }
}
