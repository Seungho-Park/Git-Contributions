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
    func toDomain()-> Profile {
        .init(id: id, name: name, homepageURL: web_url, avatarURL: avatar_url)
    }
}
