//
//  PlatformViewModel.swift
//  FeatureLogin
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import FeatureLoginInterface

public final class DefaultPlatformViewModel: PlatformViewModel {
    private let actions: PlatformViewModelActions
    
    public init(actions: PlatformViewModelActions) {
        self.actions = actions
    }
    
    public func transform(input: PlatformViewModelInput) -> PlatformViewModelOutput {
        return .init()
    }
}
