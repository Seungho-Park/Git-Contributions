//
//  Profile.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/10/23.
//

import Foundation

struct Profile {
    let id: Int
    let type: VCSType
    let host: String?
    let username: String
    let name: String
    let avatarImageURL: String
    let homepageURL: String
    
    var tokenId: Int = -1
}
