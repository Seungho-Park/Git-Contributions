//
//  Target+Template.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ModulePlugin

//MARK: Factory
public extension ProjectDescription.Target {
    struct TargetFactory {
        var name: String
        var destinations: ProjectDescription.Destinations
        var product: ProjectDescription.Product
        var productName: String?
        var bundleId: String?
        var deploymentTargets: ProjectDescription.DeploymentTargets?
        var infoPlist: ProjectDescription.InfoPlist?
        var sources: ProjectDescription.SourceFilesList?
        var resources: ProjectDescription.ResourceFileElements?
        var copyFiles: [ProjectDescription.CopyFilesAction]?
        var headers: ProjectDescription.Headers?
        var entitlements: ProjectDescription.Entitlements?
        var scripts: [ProjectDescription.TargetScript]
        var dependencies: [ProjectDescription.TargetDependency]
        var settings: ProjectDescription.Settings?
        var coreDataModels: [ProjectDescription.CoreDataModel]
        var environmentVariables: [String : ProjectDescription.EnvironmentVariable]
        var launchArguments: [ProjectDescription.LaunchArgument]
        var additionalFiles: [ProjectDescription.FileElement]
        var buildRules: [ProjectDescription.BuildRule]
        var mergedBinaryType: ProjectDescription.MergedBinaryType
        var mergeable: Bool
        var onDemandResourcesTags: ProjectDescription.OnDemandResourcesTags?
        
        public init(
            name: String = "",
            destinations: ProjectDescription.Destinations = .iOS,
            product: ProjectDescription.Product = .staticFramework,
            productName: String? = nil,
            bundleId: String? = nil,
            deploymentTargets: ProjectDescription.DeploymentTargets? = Project.Environment.deploymentTarget,
            infoPlist: ProjectDescription.InfoPlist? = .default,
            sources: ProjectDescription.SourceFilesList? = .sources,
            resources: ProjectDescription.ResourceFileElements? = nil,
            copyFiles: [ProjectDescription.CopyFilesAction]? = nil,
            headers: ProjectDescription.Headers? = nil,
            entitlements: ProjectDescription.Entitlements? = nil,
            scripts: [ProjectDescription.TargetScript] = [],
            dependencies: [ProjectDescription.TargetDependency] = [],
            settings: ProjectDescription.Settings? = nil,
            coreDataModels: [ProjectDescription.CoreDataModel] = [],
            environmentVariables: [String : ProjectDescription.EnvironmentVariable] = [:],
            launchArguments: [ProjectDescription.LaunchArgument] = [],
            additionalFiles: [ProjectDescription.FileElement] = [],
            buildRules: [ProjectDescription.BuildRule] = [],
            mergedBinaryType: ProjectDescription.MergedBinaryType = .disabled,
            mergeable: Bool = false,
            onDemandResourcesTags: ProjectDescription.OnDemandResourcesTags? = nil
        ) {
            self.name = name
            self.destinations = destinations
            self.product = product
            self.productName = productName
            self.bundleId = bundleId
            self.deploymentTargets = deploymentTargets
            self.infoPlist = infoPlist
            self.sources = sources
            self.resources = resources
            self.copyFiles = copyFiles
            self.headers = headers
            self.entitlements = entitlements
            self.scripts = scripts
            self.dependencies = dependencies
            self.settings = settings
            self.coreDataModels = coreDataModels
            self.environmentVariables = environmentVariables
            self.launchArguments = launchArguments
            self.additionalFiles = additionalFiles
            self.buildRules = buildRules
            self.mergedBinaryType = mergedBinaryType
            self.mergeable = mergeable
            self.onDemandResourcesTags = onDemandResourcesTags
        }
    }
    
    private static func makeTarget(_ factory: TargetFactory)-> Self {
        return .target(
            name: factory.name,
            destinations: factory.destinations,
            product: factory.product,
            productName: factory.productName,
            bundleId: factory.bundleId ?? Project.Environment.bundlePrefix + ".\(factory.name.lowercased())",
            deploymentTargets: factory.deploymentTargets,
            infoPlist: factory.infoPlist,
            sources: factory.sources,
            resources: factory.resources,
            copyFiles: factory.copyFiles,
            headers: factory.headers,
            entitlements: factory.entitlements,
            scripts: factory.scripts,
            dependencies: factory.dependencies,
            settings: factory.settings,
            coreDataModels: factory.coreDataModels,
            environmentVariables: factory.environmentVariables,
            launchArguments: factory.launchArguments,
            additionalFiles: factory.additionalFiles,
            buildRules: factory.buildRules,
            mergedBinaryType: factory.mergedBinaryType,
            mergeable: factory.mergeable,
            onDemandResourcesTags: factory.onDemandResourcesTags
        )
    }
}

public extension ProjectDescription.Target {
    static func application(_ target: TargetFactory)-> Self {
        var target = target
        target.name = Project.Environment.appName
        target.product = .app
        target.bundleId = Project.Environment.bundlePrefix
        target.productName = Project.Environment.appName
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func feature(_ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature"
        return .makeTarget(target)
    }
    
    static func feature(implements module: Module.Feature, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature\(module.rawValue)"
        return .makeTarget(target)
    }
    
    static func feature(interface module: Module.Feature, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature\(module.rawValue)Interface"
        target.sources = .interface
        return .makeTarget(target)
    }
    
    static func feature(testing module: Module.Feature, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature\(module.rawValue)Testing"
        target.sources = .testing
        return .makeTarget(target)
    }
    
    static func feature(tests module: Module.Feature, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature\(module.rawValue)Tests"
        target.sources = .tests
        target.product = .unitTests
        return .makeTarget(target)
    }
    
    static func feature(example module: Module.Feature, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Feature\(module.rawValue)Example"
        target.infoPlist = .example
        target.sources = .example
        target.product = .app
        target.settings = .settings(base: ["OTHER_LDFLAGS": [
            "$(inherited) -ObjC"
        ]])
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func domain(_ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain"
        return .makeTarget(target)
    }
    
    static func domain(implements module: Module.Domain, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain\(module.rawValue)"
        return .makeTarget(target)
    }
    
    static func domain(interface module: Module.Domain, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain\(module.rawValue)Interface"
        target.sources = .interface
        return .makeTarget(target)
    }
    
    static func domain(testing module: Module.Domain, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain\(module.rawValue)Testing"
        target.sources = .testing
        return .makeTarget(target)
    }
    
    static func domain(tests module: Module.Domain, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain\(module.rawValue)Tests"
        target.sources = .tests
        target.product = .unitTests
        return .makeTarget(target)
    }
    
    static func domain(example module: Module.Domain, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Domain\(module.rawValue)Example"
        target.infoPlist = .example
        target.sources = .example
        target.product = .app
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func core(_ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core"
        return .makeTarget(target)
    }
    
    static func core(implements module: Module.Core, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core\(module.rawValue)"
        return .makeTarget(target)
    }
    
    static func core(interface module: Module.Core, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core\(module.rawValue)Interface"
        target.sources = .interface
        return .makeTarget(target)
    }
    
    static func core(testing module: Module.Core, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core\(module.rawValue)Testing"
        target.sources = .testing
        return .makeTarget(target)
    }
    
    static func core(tests module: Module.Core, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core\(module.rawValue)Tests"
        target.sources = .tests
        target.product = .unitTests
        return .makeTarget(target)
    }
    
    static func core(example module: Module.Core, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Core\(module.rawValue)Example"
        target.infoPlist = .example
        target.sources = .example
        target.product = .app
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func shared(_ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared"
        return .makeTarget(target)
    }
    
    static func shared(implements module: Module.Shared, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared\(module.rawValue)"
        return .makeTarget(target)
    }
    
    static func shared(interface module: Module.Shared, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared\(module.rawValue)Interface"
        target.sources = .interface
        return .makeTarget(target)
    }
    
    static func shared(testing module: Module.Shared, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared\(module.rawValue)Testing"
        target.sources = .testing
        return .makeTarget(target)
    }
    
    static func shared(tests module: Module.Shared, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared\(module.rawValue)Tests"
        target.sources = .tests
        target.product = .unitTests
        return .makeTarget(target)
    }
    
    static func shared(example module: Module.Shared, _ target: TargetFactory)-> Self {
        var target = target
        target.name = "Shared\(module.rawValue)Example"
        target.infoPlist = .example
        target.sources = .example
        target.product = .app
        return .makeTarget(target)
    }
}
