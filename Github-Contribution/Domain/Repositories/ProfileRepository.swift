//
//  ProfileRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation

protocol ProfileRepository {
    func fetchProfile(type: VCSType, userName: String, host: String?, token: String?, completion: @escaping (Result<Profile, DataTransferError>)-> Void)
}
