//
//  SplashScene.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import SharedUIInterface
import FeatureSplashInterface

extension SplashScene: Scene {
    public func instaintiate() -> UIViewController {
        switch self {
        case .splash(let viewModel):
            return SplashViewController.create(viewModel: viewModel as! DefaultSplashViewModel)
        }
    }
}
