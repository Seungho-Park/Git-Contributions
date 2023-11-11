//
//  ProfileRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import RxSwift

class ProfileRepositoryImpl: ProfileRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService, userStorage: UserStorage, tokenStorage: TokenStorage) {
        self.dataTransferService = dataTransferService
    }
    
    func fetchProfile(profile: User, completion: @escaping (Result<Profile, Error>)-> Void)-> URLSessionTask? {
        return nil
    }
}
