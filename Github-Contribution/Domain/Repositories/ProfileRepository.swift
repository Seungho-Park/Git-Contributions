//
//  ProfileRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation

protocol ProfileRepository {
    func fetchProfile(profile: Profile)-> URLSessionTask?
    
    func fetchUserInfos(completion: @escaping (Result<[Profile], Error>)-> Void)
}
