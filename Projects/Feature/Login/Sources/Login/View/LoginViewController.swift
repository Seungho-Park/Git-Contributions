//
//  LoginViewController.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import UIKit
import SharedUI
import SharedUIInterface
import FeatureLoginInterface

public final class LoginViewController<VM: LoginViewModel>: BaseViewController<VM> {
    private lazy var startButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = UIColor(red: 97/255, green: 31/255, blue: 105/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        
    }
    
    public override func configure() {
        super.configure()
        
        containerView
            .flex
            .direction(.column)
            .define { flex in
                flex.addItem()
                    .direction(.column)
                    .grow(1)
                
                flex.addItem()
                    .justifyContent(.center)
                    .alignItems(.center)
                    .define {
                        $0.addItem(UIImageView(image: .iconGraph))
                    }
                
                flex.addItem()
                    .direction(.row)
                    .justifyContent(.center)
                    .alignItems(.end)
                    .define {
                        $0.addItem(startButton)
                            .paddingTop(12)
                            .paddingBottom(12)
                            .margin(0, 20)
                            .grow(1)
                    }
                    .grow(1)
            }
    }
    
    public override func bind() {
        super.bind()
        
        _ = viewModel.transform(
            input: .init(
                tapStartButton: startButton.rx.tap.asObservable()
            )
        )
    }
}
