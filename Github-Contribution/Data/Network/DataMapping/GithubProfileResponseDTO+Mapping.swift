//
//  GithubProfileResponseDTO.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation

struct GithubProfileResponseDTO: Decodable {
    let id: Int
    let login: String
    let name: String
    let avatar_url: String
    let html_url: String
    let created_at: String
}

extension GithubProfileResponseDTO {
    func toDomain()-> Profile {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return Profile(id: id, type: .gitlab, host: nil, username: login, name: name, avatarImageURL: avatar_url, homepageURL: html_url)
    }
}
