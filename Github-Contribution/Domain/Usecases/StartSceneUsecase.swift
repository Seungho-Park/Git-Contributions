//
//  StartSceneUsecase.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import RxSwift

protocol StartSceneUsecase {
    
}

class StartSceneUsecaseImpl: StartSceneUsecase {
    private let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    
}
