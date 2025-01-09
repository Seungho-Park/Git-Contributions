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
        var bundleId: String
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
            name: String,
            destinations: ProjectDescription.Destinations = .iOS,
            product: ProjectDescription.Product = .staticFramework,
            productName: String? = nil,
            bundleId: String,
            deploymentTargets: ProjectDescription.DeploymentTargets? = nil,
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
            bundleId: factory.bundleId,
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
        target.product = .app
        target.productName = "Git-Contributions"
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func feature(_ target: TargetFactory)-> Self {
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func domain(_ target: TargetFactory)-> Self {
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func core(_ target: TargetFactory)-> Self {
        return .makeTarget(target)
    }
}

public extension ProjectDescription.Target {
    static func shared(_ target: TargetFactory)-> Self {
        return .makeTarget(target)
    }
}
