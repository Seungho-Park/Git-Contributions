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
    
    static func feature(implements module: Module.Feature)-> Self {
        return .project(
            target: "Feature\(module.rawValue)",
            path: .feature(module),
            status: .required
        )
    }
    
    static func feature(interface module: Module.Feature)-> Self {
        return .project(
            target: "Feature\(module.rawValue)Interface",
            path: .feature(module),
            status: .required
        )
    }
    
    static func feature(tests module: Module.Feature)-> Self {
        return .project(
            target: "Feature\(module.rawValue)Tests",
            path: .feature(module),
            status: .required
        )
    }
    
    static func feature(testing module: Module.Feature)-> Self {
        return .project(
            target: "Feature\(module.rawValue)Testing",
            path: .feature(module),
            status: .required
        )
    }
    
    static func feature(example module: Module.Feature)-> Self {
        return .project(
            target: "Feature\(module.rawValue)Example",
            path: .feature(module),
            status: .required
        )
    }
}

public extension ProjectDescription.TargetDependency {
    static var domain: Self {
        return .project(
            target: "Domain",
            path: .domain,
            status: .required
        )
    }
    
    static func domain(implements module: Module.Domain)-> Self {
        return .project(
            target: "Domain\(module)",
            path: .domain(module),
            status: .required
        )
    }
    
    static func domain(interface module: Module.Domain)-> Self {
        return .project(
            target: "Domain\(module)Interface",
            path: .domain(module),
            status: .required
        )
    }
    
    static func domain(tests module: Module.Domain)-> Self {
        return .project(
            target: "Domain\(module)Tests",
            path: .domain(module),
            status: .required
        )
    }
    
    static func domain(testing module: Module.Domain)-> Self {
        return .project(
            target: "Domain\(module)Testing",
            path: .domain(module),
            status: .required
        )
    }
    
    static func feature(example module: Module.Domain)-> Self {
        return .project(
            target: "Domain\(module)Example",
            path: .domain(module),
            status: .required
        )
    }
}

public extension ProjectDescription.TargetDependency {
    static var core: Self {
        return .project(target: "Core", path: .core, status: .required)
    }
    
    static func core(implements module: Module.Core)-> Self {
        return .project(
            target: "Core\(module.rawValue)",
            path: .core(module),
            status: .required
        )
    }
    
    static func core(interface module: Module.Core)-> Self {
        return .project(
            target: "Core\(module.rawValue)Interface",
            path: .core(module),
            status: .required
        )
    }
    
    static func core(tests module: Module.Core)-> Self {
        return .project(
            target: "Core\(module.rawValue)Tests",
            path: .core(module),
            status: .required
        )
    }
    
    static func core(testing module: Module.Core)-> Self {
        return .project(
            target: "Core\(module.rawValue)Testing",
            path: .core(module),
            status: .required
        )
    }
    
    static func core(example module: Module.Core)-> Self {
        return .project(
            target: "Core\(module.rawValue)Example",
            path: .core(module),
            status: .required
        )
    }
}

public extension ProjectDescription.TargetDependency {
    static var shared: Self {
        return .project(
            target: "Shared",
            path: .shared,
            status: .required
        )
    }
    
    static func shared(implements module: Module.Shared)-> Self {
        return .project(
            target: "Shared\(module.rawValue)",
            path: .shared(module),
            status: .required
        )
    }
    
    static func shared(interface module: Module.Shared)-> Self {
        return .project(
            target: "Shared\(module.rawValue)Interface",
            path: .shared(module),
            status: .required
        )
    }
    
    static func shared(tests module: Module.Shared)-> Self {
        return .project(
            target: "Shared\(module.rawValue)Tests",
            path: .shared(module),
            status: .required
        )
    }
    
    static func shared(testing module: Module.Shared)-> Self {
        return .project(
            target: "Shared\(module.rawValue)Testing",
            path: .shared(module),
            status: .required
        )
    }
    
    static func shared(example module: Module.Shared)-> Self {
        return .project(
            target: "Shared\(module.rawValue)Example",
            path: .shared(module),
            status: .required
        )
    }
}
