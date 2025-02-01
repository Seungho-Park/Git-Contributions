//
//  PlatformViewModel.swift
//  FeatureLogin
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import SharedUIInterface

public struct PlatformViewModelActions {
    
    public init() {  }
}

public struct PlatformViewModelInput {
    
    public init() {  }
}

public struct PlatformViewModelOutput {
    
    public init() {  }
}

public protocol PlatformViewModel: ViewModel where Input == PlatformViewModelInput, Output == PlatformViewModelOutput {
    
}
