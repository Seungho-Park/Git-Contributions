//
//  StartViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class StartViewController: BaseViewController<StartViewModel> {
    private lazy var appIcon: UIImageView = {
        let icon = UIImageView(frame: .zero)
        icon.image = UIImage(named: "Icon")
        icon.contentMode = .scaleToFill
        return icon
    }()
    
    private lazy var startButton: UIButton = .makeButton(title: "Get Started".localized, bgColor: .bgStartButton, titleColor: .txtStartButton)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func bind() {
        super.bind()
        
        let output = viewModel.transform(
            StartViewModel.Input(
                
            )
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        addSubview(appIcon)
        addSubview(startButton)
        
        appIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(appIcon.snp.width)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(5)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}
