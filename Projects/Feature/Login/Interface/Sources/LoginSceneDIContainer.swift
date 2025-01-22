//
//  LoginSceneDIContainer.swift
//  FeatureLogin
//
//  Created by 박승호 on 1/21/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import SharedUIInterface
public struct LoginSceneDIContainerDependencies {
    
    public init() {
        
    }
}

public protocol LoginSceneDIContainer: DIContainer where Dependencies == LoginSceneDIContainerDependencies {
    
}
