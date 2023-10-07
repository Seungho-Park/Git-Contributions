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
    
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool)
    func close(animated: Bool)
}

extension Coordinator where Self: NSObject {
    func transition(scene: Scene, transitionStyle: TransitionStyle, animated: Bool = true) {
        
        let vc = scene.instantiate()
        
        switch transitionStyle {
        case .root:
            guard let window = window else {
                Log.e("\(Self.self)", message: TransitionError.windowNil.localizedDescription)
                return
            }
            
            rootViewController.pushViewController(vc, animated: animated)
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            
        case .push:
            guard let window = window, window.rootViewController == rootViewController else {
                Log.e("\(Self.self)", message: TransitionError.invalidRootViewController.localizedDescription)
                return
            }
            
            rootViewController.pushViewController(vc, animated: animated)
            
        case .modal:
            guard let sceneViewController = rootViewController.topViewController else {
                
                return
            }
            
            sceneViewController.present(vc, animated: animated)
        }
    }
    
    func close(animated: Bool = true) {
        guard let sceneViewController = rootViewController.topViewController else {
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
