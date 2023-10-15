//
//  ProfileStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

protocol ProfileStorage {
    func fetchProfile(completion: @escaping (Result<[Profile], Error>)-> Void)
    func saveProfile(profile: Profile, completion: @escaping (Result<Profile, Error>)-> Void)
}
