//
//  Coordinator.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//
import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
    func transition(scene: Scene, style: TransitionStyle, animated: Bool)
    func close(animated: Bool)
}

public extension Coordinator {
    func close(animated: Bool = true) {
        let vc = navigationController.topViewController ?? navigationController
        
        if let presentedVC = vc.presentedViewController {
            presentedVC.dismiss(animated: animated)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    func transition(scene: Scene, style: TransitionStyle, animated: Bool = true) {
        let vc = scene.instaintiate()
        
        switch style {
        case .root:
            navigationController.viewControllers = [vc]
        case .push:
            navigationController.pushViewController(vc, animated: animated)
        case .modal:
            let presentingVC = navigationController.topViewController ?? navigationController
            presentingVC.present(vc, animated: animated)
        }
    }
}
