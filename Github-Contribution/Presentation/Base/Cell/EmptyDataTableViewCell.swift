//
//  EmptyDataTableViewCell.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/21/23.
//

import Foundation
import UIKit

class EmptyDataTableViewCell: UITableViewCell {
    static let identifier = "\(EmptyDataTableViewCell.self)"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .lightGray
        label.text = "아직 데이터가 없어요."
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .lightGray
        label.text = "상단 + 버튼을 눌러 데이터를 추가해주세요."
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(commentLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().inset(-20)
            make.centerX.equalToSuperview()
        }
        
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
