//
//  UIViewExt.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit

extension UIView {
    var screenSize: CGSize {
        return self.window?.screen.bounds.size ?? .zero
    }
}
