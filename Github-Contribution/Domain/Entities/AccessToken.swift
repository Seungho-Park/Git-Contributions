//
//  AccessToken.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation

struct AccessToken {
    let id: Int
    let type: VCSType
    let token: String
    let host: String?
}
