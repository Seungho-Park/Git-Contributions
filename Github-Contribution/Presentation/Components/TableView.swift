//
//  TableView.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/21/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TableView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.textColor = .text
        label.text = "데이터가 없어요."
        label.textAlignment = .center
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.textColor = .text
        label.text = "+ 버튼을 눌러 데이터를 추가해주세요."
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(commentLabel)
        stackView.clipsToBounds = true
        return stackView
    }()
    
    lazy var table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let a = LoginViewController.self
        return tableView
    }()
    
    func register(_ type: AnyClass, forCellReuseIdentifier: String) {
        table.register(type, forCellReuseIdentifier: forCellReuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.addSubview(stackView)
        self.addSubview(table)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.7)
        }
        
        table.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension TableView {
    var isEmpty: Bool {
        get { self.table.isHidden && !stackView.isHidden }
        set {
            table.isHidden = newValue
            stackView.isHidden = !newValue
        }
    }
}

extension Reactive where Base: TableView {
    var isEmpty: Binder<Bool> {
        return Binder(self.base) { view, isEmpty in
            view.isEmpty = isEmpty
        }
    }
}
