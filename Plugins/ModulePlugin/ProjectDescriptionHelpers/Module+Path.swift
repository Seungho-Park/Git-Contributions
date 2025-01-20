//
//  Module+Path.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription

//MARK: Application
public extension ProjectDescription.Path {
    static var application: Self {
        return .relativeToRoot("Projects/Application")
    }
}

//MARK: - Feature
public extension ProjectDescription.Path {
    static var feature: Self {
        return .relativeToRoot("Projects/Feature")
    }
    
    static func feature(_ module: Module.Feature)-> Self {
        return .relativeToRoot("Projects/Feature/\(module.rawValue)")
    }
}

//MARK: - Domain
public extension ProjectDescription.Path {
    static var domain: Self {
        return .relativeToRoot("Projects/Domain")
    }
    
    static func domain(_ module: Module.Domain)-> Self {
        return .relativeToRoot("Projects/Domain/\(module.rawValue)")
    }
}

//MARK: - Core
public extension ProjectDescription.Path {
    static var core: Self {
        return .relativeToRoot("Projects/Core")
    }
    
    static func core(_ module: Module.Core)-> Self {
        return .relativeToRoot("Projects/Core/\(module.rawValue)")
    }
}

//MARK: - Shared
public extension ProjectDescription.Path {
    static var shared: Self {
        return .relativeToRoot("Projects/Shared")
    }
    
    static func shared(_ module: Module.Shared)-> Self {
        return .relativeToRoot("Projects/Shared/\(module.rawValue)")
    }
}
