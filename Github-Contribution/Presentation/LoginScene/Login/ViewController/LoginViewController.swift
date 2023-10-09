//
//  LoginViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(vcsIconView)
        
        vcsIconView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(vcsIconView.snp.width)
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
        }
    }
}
