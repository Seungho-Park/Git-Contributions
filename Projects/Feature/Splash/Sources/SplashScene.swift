//
//  SplashScene.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import SharedUIInterface

public enum SplashScene: Scene {
    case splash(SplashViewModel)
    
    public func instaintiate() -> UIViewController {
        switch self {
        case .splash(let viewModel):
            return SplashViewController.create(viewModel: viewModel)
        }
    }
}
