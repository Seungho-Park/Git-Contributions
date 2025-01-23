//
//  SplashViewController.swift
//  FeatureSplash
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUI
import FeatureSplashInterface

final public class SplashViewController<VM: SplashViewModel>: BaseViewController<VM> {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.text = "Git Contributions"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        containerView
            .flex
            .define { flex in
                flex
                    .addItem()
                    .alignItems(.center)
                    .justifyContent(.end)
                    .define { flex in
                        flex.addItem(titleLabel)
                    }
                    .grow(1/3)
            }
    }
    
    public override func bind() {
        super.bind()
        
        _ = viewModel.transform(
            input: .init(
                viewDidAppear: rx.viewDidAppear.asObservable()
            )
        )
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.pin.all()
        containerView.flex.layout()
    }
}
