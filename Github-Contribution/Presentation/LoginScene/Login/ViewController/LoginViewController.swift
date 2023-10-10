//
//  LoginViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//
//TODO: - UserName 입력 후 확인 버튼 클릭. UserName으로 API Profile 조회. 있으면 넘어가고 없으면 알람창 -

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController<LoginViewModel> {
    fileprivate lazy var vcsIconView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Submit".localized, for: .normal)
        btn.backgroundColor = .bgStartButton
        btn.setTitleColor(.txtStartButton, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(vcsIconView)
        addSubview(submitButton)
        
        vcsIconView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(vcsIconView.snp.width)
        }
        
        submitButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(5)
            make.height.equalTo(50)
        }
    }
    
    override func bind() {
        super.bind()
        let output = viewModel.transform(.init())
        
        output.vcsType
            .drive(self.rx.vcsType)
            .disposed(by: rx.disposeBag)
    }
}

extension Reactive where Base: LoginViewController {
    var vcsType: Binder<VCSType> {
        return Binder(self.base) { vc, type in
            if type == .unknown {
                return
            }
            
            vc.vcsIconView.image = type.string.image
            let stackView = UIStackView(frame: .zero)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            
            vc.addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.top.equalTo(vc.vcsIconView.snp.bottom).offset(20)
                make.leading.trailing.equalToSuperview().inset(30)
                make.height.equalTo(120)
            }
            
            let hostInputView = InputTextView(frame: .zero)
            hostInputView.title = "Host".localized
            hostInputView.placeholder = "https://example.com"
            let userNameInputView = InputTextView(frame: .zero)
            userNameInputView.title = "Username".localized
            userNameInputView.placeholder = "Username".localized
            
            if type == .github {
                hostInputView.isEnabled = false
                hostInputView.text = "https://github.com"
            }
            
            stackView.addArrangedSubview(hostInputView)
            stackView.addArrangedSubview(userNameInputView)
        }
    }
}
