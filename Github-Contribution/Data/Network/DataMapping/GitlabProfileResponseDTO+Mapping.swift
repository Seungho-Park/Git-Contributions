//
//  GitlabProfileResponseDTO.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation

struct GitlabProfileResponseDTO: Decodable {
    let id: Int
    let username: String
    let name: String
    let avatar_url: String
    let web_url: String
}

extension GitlabProfileResponseDTO {
    func toDomain(host: String? = nil)-> Profile {
        return Profile(id: id, type: .gitlab, host: host ?? "https://gitlab.com", username: username, name: name, avatarImageURL: avatar_url, homepageURL: web_url)
    }
}
