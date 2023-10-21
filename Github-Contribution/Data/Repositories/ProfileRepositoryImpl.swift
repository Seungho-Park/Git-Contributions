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
    private let userStorage: UserStorage
    
    init(dataTransferService: DataTransferService, userStorage: UserStorage) {
        self.dataTransferService = dataTransferService
        self.userStorage = userStorage
    }
    
    func fetchProfile(profile: User, completion: @escaping (Result<Profile, Error>)-> Void)-> URLSessionTask? {
        switch profile.type {
        case .github: 
            let endpoint = APIEndPoints.fetchGithubProfile(with: .init(host: "", userName: profile.username, token: nil))
            return dataTransferService.request(with: endpoint) { result in
                switch result {
                case .success(let response):
                    completion(.success(response.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .gitlab: break
        default: break
        }
        
        return nil
    }
    
    func fetchUserInfos(completion: @escaping (Result<[User], Error>)-> Void) {
        userStorage.fetchUsers(completion: completion)
    }
    
    func saveUser(user: User) {
        userStorage.saveUser(user: user)
    }
}
