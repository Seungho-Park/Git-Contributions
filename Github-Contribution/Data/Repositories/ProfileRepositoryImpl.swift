//
//  ProfileRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

class ProfileRepositoryImpl: ProfileRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func fetchProfile(
        type: VCSType,
        userName: String,
        host: String? = nil,
        token: String? = nil,
        completion: @escaping (Result<Profile, DataTransferError>)-> Void
    ) {
        switch type {
        case .github:
            let endpoint = APIEndPoints.fetchGithubProfile(with: .init(host: host ?? "", userName: userName, token: token))
            dataTransferService.request(with: endpoint) { result in
                switch result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .gitlab:
            let endpint = APIEndPoints.fetchGitlabProfile(with: .init(host: host ?? "", userName: userName, token: token))
            dataTransferService.request(with: endpint) { result in
                switch result {
                case .success(let response):
                    if let responseData = response.first {
                        print(responseData)
                    } else {
                        completion(.failure(.noResponse))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .unknown: break
        }
    }
}
