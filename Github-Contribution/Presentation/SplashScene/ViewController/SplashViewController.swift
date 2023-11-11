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
    private lazy var field = InputTextView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview(logoView)
        addSubview(field)
        
        
        logoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        field.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func bind() {
        super.bind()
        
        field.rx.tap.subscribe { _ in
            print("Tap")
        }.disposed(by: rx.disposeBag)
        
        _ = viewModel.transform(SplashViewModel.Input(
            viewDidAppear: self.rx.viewDidAppear.asObservable()
        ))
    }
}
