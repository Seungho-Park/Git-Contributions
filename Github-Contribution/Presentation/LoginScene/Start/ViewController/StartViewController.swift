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
    
    private lazy var startButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get Started".localized, for: .normal)
        btn.backgroundColor = UIColor(named: "bgStartButton")
        btn.setTitleColor(UIColor(named: "txtStartButton"), for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func bind() {
        super.bind()
        
        let output = viewModel.transform(
            StartViewModel.Input(
                touchedStartButton: startButton.rx.tap.asObservable()
            )
        )
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
