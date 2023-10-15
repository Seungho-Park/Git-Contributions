//
//  ProfileRepositoryImpl.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

class ProfileRepositoryImpl: ProfileRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}
