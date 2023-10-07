//
//  Coordinator.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

protocol Coordinator: NSObject {
    var window: UIWindow? { get set }
    var rootViewController: UIViewController? { get set }
    
    func start()
    
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool)
    func close(animated: Bool)
}

extension Coordinator {
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool = true) {
        
        let vc = scene.instantiate()
        
        switch transitionStyle {
        case .root:
            guard let window = window else {
                Log.e("\(Self.self)", message: TransitionError.windowNil.localizedDescription)
                return
            }
            
            if let navController = rootViewController as? UINavigationController {
                
            } else {
                rootViewController = vc
                window.rootViewController = rootViewController
                window.makeKeyAndVisible()
            }
        case .push:
            if let rootViewController = rootViewController as? UINavigationController {
                rootViewController.pushViewController(vc, animated: animated)
            } else {
                //TODO: Error -
            }
        case .modal:
            guard let sceneViewController = rootViewController?.sceneViewController else {
                return
            }
            
            sceneViewController.present(vc, animated: animated)
        }
    }
    
    func close(animated: Bool = true) {
        guard let sceneViewController = rootViewController?.sceneViewController else {
            return
        }
        
        if let presentedVC = sceneViewController.presentedViewController {
            presentedVC.dismiss(animated: animated)
        } else if let navController = sceneViewController.navigationController{
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
