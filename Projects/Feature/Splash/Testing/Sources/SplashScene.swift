//
//  SplashScene.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit
import FeatureSplashInterface
import SharedUIInterface

extension SplashScene: @retroactive Scene {
    public func instaintiate() -> UIViewController {
        switch self {
        case .splash(let viewModel):
            return UIViewController()
        }
    }
}
