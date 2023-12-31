//
//  InputTextView.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/10/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class InputTextView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .text
        label.numberOfLines = 1
        return label
    }()
    
    fileprivate lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .right
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.delegate = self
        return textField
    }()
    
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var text: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }
    
    var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    var isSecureTextEntry: Bool {
        get { return textField.isSecureTextEntry }
        set { textField.isSecureTextEntry = newValue }
    }
    
    var isEnabled: Bool {
        get { return textField.isEnabled }
        set { textField.isEnabled = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tapGesture)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.border.cgColor
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(textField)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview()
        }
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
    }
}


extension InputTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension Reactive where Base: InputTextView {
    var text: ControlProperty<String?> {
        return self.base.textField.rx.text
    }
    
    var tap: ControlEvent<Void> {
        let source = methodInvoked(#selector(Base.tap)).map { _ in }
        return ControlEvent(events: source)
    }
}
