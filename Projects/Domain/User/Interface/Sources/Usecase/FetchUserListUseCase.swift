//
//  FetchUserListUsecase.swift
//  DomainUser
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import SharedThirdPartyLibs

public protocol FetchUserListUseCase {
    func execute()-> Single<[User]>
}
