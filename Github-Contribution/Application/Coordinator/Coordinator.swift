//
//  Coordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var window: UIWindow? { get set }
    var rootViewController: UINavigationController { get set }
    
    func start()
    
    mutating func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool)
    mutating func close(animated: Bool)
}

extension Coordinator {
    mutating func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool = true) {
        
        let vc = scene.instantiate()
        
        switch transitionStyle {
        case .root:
            guard let window = window else {
                print(TransitionError.windowNil)
                return
            }
            
            rootViewController.pushViewController(vc, animated: animated)
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        case .push: break
        case .modal: break
        }
    }
    
    mutating func close(animated: Bool = true) {
        
    }
}

private extension UIViewController {
    var sceneViewController: UIViewController {
        self.children.first ?? self
    }
}
