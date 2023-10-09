//
//  StringExt.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
