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
    private let userStorage: UserStorage = CoreDataUserStorage()
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func fetchProfile(profile: Profile) {
        switch profile.type {
        case .github: 
            let endpoint = APIEndPoints.fetchGithubProfile(with: .init(host: "", userName: profile.username, token: nil))
            dataTransferService.request(with: endpoint) { result in
                switch result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
        case .gitlab: break
        default: break
        }
    }
    
    func fetchUserInfos(completion: @escaping (Result<[Profile], Error>)-> Void) {
        userStorage.fetchUsers(completion: completion)
    }
}
