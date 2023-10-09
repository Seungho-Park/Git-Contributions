//
//  VCSType.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/9/23.
//

import Foundation

enum VCSType: Int {
    case github = 0
    case gitlab = 1
    case unknown = 99
    
    var string: String {
        switch self {
        case .github: return "Github"
        case .gitlab: return "Gitlab"
        case .unknown: return "N/A"
        }
    }
}
