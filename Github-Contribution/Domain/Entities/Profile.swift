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
    let homepageURL: String
    
    //아바타와 토큰 정보는 바뀔 수 있음.
    var name: String
    var avatarImageURL: String
    var tokenId: Int = -1
}
