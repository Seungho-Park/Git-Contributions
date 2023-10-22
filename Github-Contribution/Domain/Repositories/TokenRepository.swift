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
    func fetchTokens()-> Single<[AccessToken]>
    
    @discardableResult
    func saveToken(token: AccessToken)-> Single<AccessToken>
}
