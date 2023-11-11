//
//  ProfileRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import RxSwift

protocol ProfileRepository {
    func fetchProfile(profile: User, completion: @escaping (Result<Profile, Error>)-> Void)-> URLSessionTask?
}
