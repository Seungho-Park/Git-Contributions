//
//  GCTabBarController.swift
//  FeatureSplash
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import FeatureSplashInterface
import SharedUI
import UIKit

final public class GCTabBarController<VM: GCTabBarViewModel>: BaseViewController<VM> {    
    private lazy var tabBar: UITabBarController = {
        let controller = UITabBarController()
        controller.view.isOpaque = false
        controller.view.backgroundColor = .clear
        return controller
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 0.6)
        return view
    }()
    
    public var viewControllers: [UIViewController] {
        get { return tabBar.viewControllers ?? [] }
        set { tabBar.viewControllers = newValue }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func configure() {
        super.configure()
        addChild(tabBar)
        tabBar.didMove(toParent: self)
        
        containerView.flex.define {
            $0.addItem(tabBar.view)
        }
        
        self.view.addSubview(bottomView)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bottomView.pin.left().right().bottom().height(self.view.pin.safeArea.bottom)
    }
}
