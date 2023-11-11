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
    private lazy var contentsView: PlatformListView = PlatformListView(frame: .zero, platforms: [.github, .gitlab])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentsView.frame.origin.y = self.view.screenSize.height
        
        UIView.animate(withDuration: 0.15) {
            self.viewModel.backgroundColor
                .map { UIColor(named: $0) }
                .drive(self.view.rx.backgroundColor)
                .disposed(by: self.rx.disposeBag)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.contentsView.frame.origin.y = (self.contentsView.frame.origin.y - self.contentsView.frame.height)
        }
    }
    
    override func bind() {
        let _ = viewModel.transform(
            .init(
                
            )
        )
    }
}
