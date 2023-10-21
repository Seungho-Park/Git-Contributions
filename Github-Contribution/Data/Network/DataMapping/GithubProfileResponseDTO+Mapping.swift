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
        .init(id: id, name: name, homepageURL: html_url, avatarURL: avatar_url)
    }
}
