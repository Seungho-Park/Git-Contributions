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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.register(EmptyDataTableViewCell.self, forCellReuseIdentifier: EmptyDataTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTokenButton)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(searchView)
        addSubview(tableView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
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


extension TokenManagementViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmptyDataTableViewCell.identifier, for: indexPath)
        return cell
    }
}

extension TokenManagementViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
