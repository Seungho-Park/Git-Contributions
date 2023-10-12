//
//  TokenManageViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TokenManagementViewController: BaseViewController<TokenManagementViewModel> {
    private lazy var addTokenButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setImage(.init(systemName: "plus"), for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTokenButton)
    }
    
    override func bind() {
        super.bind()
        
        let output = viewModel.transform(
            TokenManagementViewModel.Input(
                tapAddButton: addTokenButton.rx.tap.asObservable()
            )
        )
    }
}
