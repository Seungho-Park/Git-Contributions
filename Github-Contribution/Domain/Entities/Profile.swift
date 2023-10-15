//
//  Profile.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/10/23.
//

import Foundation

struct Profile {
    //얘넨 바껴버리면 조회가 안됨.
    let id: Int
    let type: VCSType
    let host: String?
    let username: String
    
    var homepageURL: String
    var name: String
    var avatarImageURL: String
    var tokenId: Int = -1
}
