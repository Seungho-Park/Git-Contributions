//
//  Module+Dependency.swift
//  ModulePlugin
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription

public extension ProjectDescription.TargetDependency {
    static var application: Self {
        return .project(target: "Application", path: .application, status: .required, condition: nil)
    }
}

public extension ProjectDescription.TargetDependency {
    static var feature: Self {
        return .project(target: "Feature", path: .feature, status: .required, condition: nil)
    }
}

public extension ProjectDescription.TargetDependency {
    static var domain: Self {
        return .project(target: "Domain", path: .domain, status: .required, condition: nil)
    }
}

public extension ProjectDescription.TargetDependency {
    static var core: Self {
        return .project(target: "Core", path: .core, status: .required, condition: nil)
    }
}

public extension ProjectDescription.TargetDependency {
    static var shared: Self {
        return .project(target: "Shared", path: .shared, status: .required, condition: nil)
    }
}
