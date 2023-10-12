//
//  APIEndPoints.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/11/23.
//

import Foundation

struct APIEndPoints {
    static func getProfile(with requestDTO: VCSRequestDTO)-> Requestable? {
        switch requestDTO.type {
        case .github:
            var header: [String:String] = ["Accept":"application/vnd.github+json", "X-GitHub-Api-Version":"2022-11-28"]
            if let token = requestDTO.token {
                header.updateValue("bearer \(token)", forKey: "Authorization")
            }
            return EndPoint<GithubProfileResponseDTO>(url: "https://api.github.com", path: "users/\(requestDTO.userName)", httpMethod: .get, header: header)
        case .gitlab:
            let header: [String:String] = ["PRIVATE-TOKEN":"\(requestDTO.token ?? "")"]
            return EndPoint<GitlabProfileResponseDTO>(url: requestDTO.host, path: "api/v4/users", header: header, queryParameters: ["username":"\(requestDTO.userName)"])
        case .unknown: return nil
        }
    }
    
    static func getContributions(type: VCSType, userName: String) {
        
    }
}
