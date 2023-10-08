//
//  SplashViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SplashViewController: BaseViewController<SplashViewModel> {
    private lazy var logoView: LogoView = LogoView(frame: .zero)
    
    private let isAppear: BehaviorRelay<Bool> = .init(value: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isAppear.accept(true)
    }
    
    override func bind() {
        super.bind()
        
        let output = viewModel.transform(SplashViewModel.Input(
            viewDidAppear: isAppear.asObservable())
        )
    }
}
