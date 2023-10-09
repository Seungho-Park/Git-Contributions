//
//  PlatformViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class PlatformViewController: BaseViewController<PlatformViewModel> {
    private lazy var contentsView: PlatformListView = PlatformListView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentsView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        UIView.animate(withDuration: 0.15) {
            self.viewModel.backgroundColor
                .map { UIColor(named: $0) }
                .drive(self.view.rx.backgroundColor)
                .disposed(by: self.rx.disposeBag)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func bind() {
        viewModel.transform(
            .init(
                dismiss: contentsView.dismiss.asDriver()
            )
        )
    }
}
