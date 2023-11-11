//
//  Coordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
    
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool)
    func close(animated: Bool, completion: @escaping ()-> Void)
}

extension Coordinator {
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool = true) {
        
        let vc = scene.instantiate()
        
        switch transitionStyle {
        case .push:
            navigationController.pushViewController(vc, animated: animated)
        case .modal:
            let sceneVC = navigationController.sceneViewController
            
            sceneVC.present(vc, animated: animated)
        }
    }
    
    func close(animated: Bool = true, completion: @escaping ()-> Void = {}) {
        let sceneVC = navigationController.sceneViewController
        
        if let presentedVC = sceneVC.presentedViewController {
            presentedVC.dismiss(animated: animated, completion: completion)
        } else if let navController = sceneVC.navigationController{
            navController.popViewController(animated: animated)
        } else {
            //TODO: Error -
        }
    }
}

private extension UIViewController {
    var sceneViewController: UIViewController {
        if let nav = self as? UINavigationController {
            return nav.topViewController!
        } else {
            return self
        }
    }
}
