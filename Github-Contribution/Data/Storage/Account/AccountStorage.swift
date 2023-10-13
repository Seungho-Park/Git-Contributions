//
//  AccountStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

protocol AccountStorage {    
    func fetchAccounts(completion: @escaping (Result<[Profile], Error>)-> Void)
    func saveAccount(profile: Profile, completion: @escaping (Result<Profile, Error>)-> Void)
}
