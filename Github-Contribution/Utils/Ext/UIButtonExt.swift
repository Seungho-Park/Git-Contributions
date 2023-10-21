//
//  UIButtonExt.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit

extension UIButton {
    static func makeButton(title: String, bgColor: UIColor?, titleColor: UIColor?, cornerRadius: CGFloat = 10) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        btn.backgroundColor = bgColor
        btn.setTitleColor(titleColor, for: .normal)
        btn.layer.cornerRadius = cornerRadius
        return btn
    }
}
