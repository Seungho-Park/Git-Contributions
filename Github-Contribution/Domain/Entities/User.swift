//
//  User.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/10/23.
//

import Foundation

struct User {
    //얘넨 바껴버리면 조회가 안됨.
    var id: Int
    let type: VCSType
    let host: String?
    let username: String
    var token_id: Int
    
    var profile: Profile? = nil
}
