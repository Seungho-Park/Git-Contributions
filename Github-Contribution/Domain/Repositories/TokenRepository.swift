//
//  TokenRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/15/23.
//

import Foundation

protocol TokenRepository {
    func fetchTokens(type: VCSType, host: String?, completion: @escaping (Result<[AccessToken], Error>)-> Void)
}
