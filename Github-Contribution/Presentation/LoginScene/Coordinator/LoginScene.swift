//
//  LoginScene.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit

enum LoginScene: Scene {
    case platform(PlatformViewModel)
    
    func instantiate() -> UIViewController {
        switch self {
        case .platform(let viewModel): 
            let vc = PlatformViewController.create(viewModel: viewModel)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            return vc
        }
    }
}
