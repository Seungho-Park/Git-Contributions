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
    private let accountStorage: AccountStorage = CoreDataAccountStorage()
    
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
                    completion(.success(response.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .gitlab:
            let endpint = APIEndPoints.fetchGitlabProfile(with: .init(host: host ?? "https://gitlab.com", userName: userName, token: token))
            dataTransferService.request(with: endpint) { result in
                switch result {
                case .success(let response):
                    if let responseData = response.first {
                        completion(.success(responseData.toDomain(host: host)))
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
    
    func saveAccount(profile: Profile) {
        accountStorage.saveAccount(profile: profile) { result in
            if case .failure(_) = result {
                //TODO: 실패 에러 처리
            }
        }
    }
    
    func fetchAccounts(completion: @escaping (Result<[Profile], Error>) -> Void) {
        accountStorage.fetchAccounts(completion: completion)
    }
}
