//
//  StringExt.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var image: UIImage? {
        return UIImage(named: self)
    }
    
    func getWidth(font: UIFont)-> CGFloat {
        return NSString(string: self).size(withAttributes: [NSAttributedString.Key.font : font]).width
    }
}
