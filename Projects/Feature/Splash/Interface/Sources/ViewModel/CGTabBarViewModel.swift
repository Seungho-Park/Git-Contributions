//
//  CGTabBarViewModel.swift
//  FeatureSplash
//
//  Created by 박승호 on 2/1/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import SharedUIInterface

public struct GCTabBarViewModelActions {
    
    public init() {  }
}

public struct GCTabBarViewModelInput {
 
    public init() {  }
}

public struct GCTabBarViewModelOutput {
    
    public init() {  }
}

public protocol GCTabBarViewModel: ViewModel where Input == GCTabBarViewModelInput, Output == GCTabBarViewModelOutput {
    
}
