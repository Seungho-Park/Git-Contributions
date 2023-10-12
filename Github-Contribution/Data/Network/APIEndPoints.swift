//
//  APIEndPoints.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/11/23.
//

import Foundation

struct APIEndPoints {
    static func fetchGithubProfile(with requestDTO: VCSRequestDTO)-> EndPoint<GithubProfileResponseDTO> {
        var header: [String:String] = ["Accept":"application/vnd.github+json", "X-GitHub-Api-Version":"2022-11-28"]
        if let token = requestDTO.token {
            header.updateValue("bearer \(token)", forKey: "Authorization")
        }
        
        return EndPoint<GithubProfileResponseDTO>(
            url: "https://api.github.com",
            path: "users/\(requestDTO.userName)",
            httpMethod: .get,
            header: header
        )
    }
    
    static func fetchGitlabProfile(with requestDTO: VCSRequestDTO)-> EndPoint<[GitlabProfileResponseDTO]> {
        return EndPoint<[GitlabProfileResponseDTO]>(
            url: requestDTO.host,
            path: "api/v4/users",
            header: requestDTO.token != nil ? ["PRIVATE-TOKEN":"\(requestDTO.token!)"] : [:],
            queryParameters: ["username":"\(requestDTO.userName)"]
        )
    }
    
    static func getContributions(type: VCSType, userName: String) {
        
    }
}
