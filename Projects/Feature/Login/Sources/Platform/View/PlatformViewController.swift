//
//  PlatformViewController.swift
//  FeatureLogin
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import UIKit
import SharedUI
import FeatureLoginInterface

public final class PlatformViewController<VM: PlatformViewModel>: BaseViewController<VM> {
    private lazy var testView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .purple
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isHidden = true
        self.view.backgroundColor = .clear
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.testView.frame = .init(origin: .init(x: testView.frame.minX, y: testView.frame.maxY), size: testView.frame.size)
        
        testView.pin.top(to: containerView.edge.bottom)
        if self.view.isHidden {
            self.view.isHidden = false
            UIView.animate(withDuration: 0.2) { [unowned self] in
                view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
                testView.pin.bottom().height(250)
            }
        }
    }
    
    public override func configure() {
        super.configure()
        
        
        containerView
            .flex
            .addItem(testView)
    }
    
    public override func bind() {
        super.bind()
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.pin.all()
        containerView.flex.layout()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if let touch = touches.first , touch.view == self.containerView {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.2,
            animations: { [unowned self] in
                view.backgroundColor = .clear
                testView.pin.left().right().top(to: containerView.edge.bottom)
            },
            completion: { _ in
                super.dismiss(animated: flag, completion: completion)
            }
        )
    }
}
