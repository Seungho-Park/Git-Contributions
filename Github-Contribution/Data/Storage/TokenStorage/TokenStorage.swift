//
//  TokenStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation

protocol TokenStorage {
    func fetchTokens(completion: @escaping (Result<[AccessToken], Error>)-> Void)
}
