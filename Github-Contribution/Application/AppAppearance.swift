//
//  AppAppearance.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit

final class AppAppearance {
    private init() {  }
    
    static func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? .white]
        appearance.backgroundColor = UIColor(named: "NavigationBar")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
