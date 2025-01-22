//
//  DIContainer.swift
//  SharedUI
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit

public protocol DIContainer {
    associatedtype Dependencies
    var dependencies: Dependencies { get }
    
    func makeCoordinator(navigationController: UINavigationController)-> Coordinator
}
