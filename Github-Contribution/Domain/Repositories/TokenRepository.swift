//
//  TokenRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/15/23.
//

import Foundation
import RxSwift

protocol TokenRepository {
    @discardableResult
    func fetchAll()-> Single<[AccessToken]>
    
    func fetchTokens(type: VCSType, host: String?, completion: @escaping (Result<[AccessToken], Error>)-> Void)
    func saveToken(token: AccessToken)
}
