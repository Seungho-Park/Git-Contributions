//
//  UIImage+Extension.swift
//  SharedUI
//
//  Created by 박승호 on 1/23/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import UIKit

public extension UIImage {
    static var iconGraph: UIImage? {
        return UIImage(named: "ic_contribution", in: Bundle.module, with: nil)
    }
}
