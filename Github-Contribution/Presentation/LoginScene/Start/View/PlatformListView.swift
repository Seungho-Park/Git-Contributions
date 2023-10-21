//
//  PlatformListView.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PlatformListView: UIView {
    private lazy var bottomPadding: CGFloat = {
        let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }()
    
    private lazy var gestureArea: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(ViewGestureRecognizer(target: self, action: #selector(self.gesture(_:))))
        let line = UIView(frame: .zero)
        line.backgroundColor = .lightGray
        line.layer.cornerRadius = 1.5
        
        view.addSubview(line)
        line.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        self.platforms.map { makePlatformButton(type: $0) }.forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.text = "Gitlab only supported for self-hosted".localized
        label.isHidden = true
        return label
    }()
    
    let dismiss: BehaviorRelay<Bool> = .init(value: false)
    let selectPlatform: BehaviorRelay<VCSType> = BehaviorRelay<VCSType>(value: .unknown)
    private var platforms: [VCSType] = []
    
    convenience init(frame: CGRect, platforms: [VCSType] = []) {
        self.init(frame: frame)
        self.platforms = platforms
        
        commit()
        setupUI()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commit() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = UIColor(named: "NavigationBar")
    }
    
    private func setupUI() {
        addSubview(gestureArea)
        addSubview(stackView)
        addSubview(infoLabel)
        
        gestureArea.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(5)
            make.top.equalTo(stackView.snp.bottom).offset(5)
        }
    }
    
    private func makePlatformButton(type: VCSType)-> UIButton {
        let buttonImage = type.string.image
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle("Continue with \(type.string)".localized, for: .normal)
        button.setTitleColor(.normalPlatformButton, for: .normal)
        button.setTitleColor(.highlightPlatformButton, for: .highlighted)
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        switch type {
        case .github: button.backgroundColor = .white
        case .gitlab: button.backgroundColor = .orange
        default: break
        }
        
        button.contentHorizontalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -(buttonImage?.size.width ?? 1) * 0.05, bottom: 5, right: 0)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(buttonImage?.size.width ?? 1) * 0.7, bottom: 0, right: 0)
        
        button.rx.tap
            .bind { [unowned self] _ in
                self.selectPlatform.accept(type)
            }.disposed(by: rx.disposeBag)
        return button
    }
}

private extension PlatformListView {
    private class ViewGestureRecognizer: UIPanGestureRecognizer {
        var changedY: CGFloat = 0
    }
    
    @objc
    private func gesture(_ sender: ViewGestureRecognizer) {
        let offset = sender.translation(in: self)
        
        guard offset.y > 0 else {
            return
        }
        
        if sender.state == .changed {
            self.frame.origin.y += offset.y - sender.changedY
            sender.changedY = offset.y
        } else if sender.state == .ended {
            sender.changedY = 0
            
            if offset.y > self.frame.height/2 {
                UIView.animate(
                    withDuration: 0.1,
                    animations: {
                        self.frame.origin.y = (self.window?.screen.bounds.height ?? 0)
                    },
                    completion: { isComplete in
                        self.dismiss.accept(isComplete)
                    }
                )
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.frame.origin.y = (self.window?.screen.bounds.height ?? 0) - self.frame.height
                }
            }
        }
    }
}
