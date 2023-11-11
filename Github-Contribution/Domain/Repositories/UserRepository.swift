//
//  UserRepository.swift
//  Github-Contribution
//
//  Created by 박승호 on 11/11/23.
//

import Foundation
import RxSwift

protocol UserRepository {
    func fetchUsers()-> Single<[User]>
}
