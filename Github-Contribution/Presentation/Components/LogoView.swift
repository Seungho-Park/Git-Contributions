//
//  LogoView.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/8/23.
//

import Foundation
import UIKit
import SnapKit

class LogoView: UIStackView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Git"
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Contributions"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillEqually
        alignment = .fill
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(subTitleLabel)
    }
}
