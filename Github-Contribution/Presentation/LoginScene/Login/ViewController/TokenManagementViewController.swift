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
import NSObject_Rx

class TokenManagementViewController: BaseViewController<TokenManagementViewModel> {
    private lazy var addTokenButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setImage(.init(systemName: "plus"), for: .normal)
        return btn
    }()
    
    private lazy var searchView: UISearchTextField = {
        let search = UISearchTextField(frame: .zero)
        search.returnKeyType = .done
        search.delegate = self
        return search
    }()
    
    private lazy var tableView: TableView = TableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTokenButton)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(searchView)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        searchView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
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


extension TokenManagementViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
