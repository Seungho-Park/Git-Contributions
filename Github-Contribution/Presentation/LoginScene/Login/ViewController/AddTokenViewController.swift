//
//  AddTokenViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/21/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AddTokenViewController: BaseViewController<AddTokenViewModel> {
    private lazy var tokenNameView: InputTextView = {
        let view = InputTextView(frame: .zero)
        view.title = "Note".localized
        view.placeholder = "What’s this token for?"
        return view
    }()
    
    private lazy var tokenInputView: InputTextView = {
        let view = InputTextView(frame: .zero)
        view.title = "Token".localized
        view.placeholder = "Input Token Here"
        return view
    }()
    
    private lazy var hostView: InputTextView = {
        let view = InputTextView(frame: .zero)
        view.title = "Host"
        view.placeholder = "Host Address"
        
        return view
    }()
    
    private lazy var guideLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.text = "Using Gitlab Self-hosted?\nPlease check the Host Address.".localized
        return label
    }()
    
    private lazy var submitButton: UIButton = .makeButton(title: "Submit".localized, bgColor: .bgStartButton, titleColor: .txtStartButton)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(hostView)
        addSubview(guideLabel)
        addSubview(tokenNameView)
        addSubview(tokenInputView)
        addSubview(submitButton)
    }
    
    private func setupConstraints() {
        guideLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalTo(hostView).inset(5)
        }
        
        hostView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(guideLabel.snp.bottom).offset(5)
            make.height.equalTo(50)
        }
        
        tokenNameView.snp.makeConstraints { make in
            make.top.equalTo(hostView.snp.bottom).offset(10)
            make.leading.trailing.height.equalTo(hostView)
        }
        
        tokenInputView.snp.makeConstraints { make in
            make.top.equalTo(tokenNameView.snp.bottom).offset(10)
            make.leading.trailing.height.equalTo(hostView)
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
                
            )
        )
    }
}
