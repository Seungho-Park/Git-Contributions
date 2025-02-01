//
//  AppAppearance.swift
//  Git-Contributions
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit

final class AppAppearance {
    private init() {  }
    
    static func configure() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 0.6)
        appearance.shadowColor = .clear
        UITabBar.appearance().standardAppearance = appearance
    }
}
