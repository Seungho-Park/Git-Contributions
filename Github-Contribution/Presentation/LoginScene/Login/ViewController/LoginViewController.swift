//
//  LoginViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//
//TODO: - UserName 입력 후 확인 버튼 클릭. UserName으로 API Profile 조회. 있으면 넘어가고 없으면 알람창
//TODO: Gitlab의 경우 Private Token 입력을 받을 수 있도록 해야할듯. -

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
    
    fileprivate lazy var hostInputView: InputTextView = {
        let hostInputView = InputTextView(frame: .zero)
        hostInputView.title = "Host".localized
        hostInputView.placeholder = "https://example.com"
        return hostInputView
    }()
    
    fileprivate lazy var userNameInputView: InputTextView = {
        let userNameInputView = InputTextView(frame: .zero)
        userNameInputView.title = "Username".localized
        userNameInputView.placeholder = "Username".localized
        return userNameInputView
    }()
    
    fileprivate lazy var tokenInputView: InputTextView = {
        let tokenInputView = InputTextView(frame: .zero)
        tokenInputView.title = "Access-Token".localized
        tokenInputView.placeholder = "Access-Token".localized
        tokenInputView.isEnabled = false
        tokenInputView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapTokenInputView))
        tokenInputView.addGestureRecognizer(tap)
        return tokenInputView
    }()
    
    private var tapToken: PublishRelay<Void> = .init()
    
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
        
        let output = viewModel.transform(
            .init(
                tapToken: tapToken.asObservable(),
                tapSubmit: submitButton.rx.tap.asObservable(),
                host: hostInputView.rx.text.asObservable()
            )
        )
        
        output.vcsType
            .drive(self.rx.vcsType)
            .disposed(by: rx.disposeBag)
    }
    
    @objc
    private func tapTokenInputView() {
        tapToken.accept(())
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
                make.height.equalTo(190)
            }
            
            if type == .github {
                vc.hostInputView.isEnabled = false
                vc.hostInputView.text = "https://github.com"
                vc.tokenInputView.title = "Access-Token".localized
                vc.tokenInputView.placeholder = "Access-Token(Optional)".localized
            } else {
                vc.tokenInputView.title = "PRIVATE-TOKEN"
                vc.tokenInputView.placeholder = "PRIVATE-TOKEN".localized
            }
            
            stackView.addArrangedSubview(vc.hostInputView)
            stackView.addArrangedSubview(vc.userNameInputView)
            stackView.addArrangedSubview(vc.tokenInputView)
        }
    }
}
