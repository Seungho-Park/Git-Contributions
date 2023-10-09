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
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = true
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
    
    let dismiss: BehaviorRelay<Bool> = .init(value: false)
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
        backgroundColor = .cyan
    }
    
    private func setupUI() {
        addSubview(gestureArea)
        gestureArea.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
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
