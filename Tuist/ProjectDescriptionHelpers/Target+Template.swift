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
        let name: String
        let destinations: ProjectDescription.Destinations
        let product: ProjectDescription.Product
        let productName: String?
        let bundleId: String
        let deploymentTargets: ProjectDescription.DeploymentTargets?
        let infoPlist: ProjectDescription.InfoPlist?
        let sources: ProjectDescription.SourceFilesList?
        let resources: ProjectDescription.ResourceFileElements?
        let copyFiles: [ProjectDescription.CopyFilesAction]?
        let headers: ProjectDescription.Headers?
        let entitlements: ProjectDescription.Entitlements?
        let scripts: [ProjectDescription.TargetScript]
        let dependencies: [ProjectDescription.TargetDependency]
        let settings: ProjectDescription.Settings?
        let coreDataModels: [ProjectDescription.CoreDataModel]
        let environmentVariables: [String : ProjectDescription.EnvironmentVariable]
        let launchArguments: [ProjectDescription.LaunchArgument]
        let additionalFiles: [ProjectDescription.FileElement]
        let buildRules: [ProjectDescription.BuildRule]
        let mergedBinaryType: ProjectDescription.MergedBinaryType
        let mergeable: Bool
        let onDemandResourcesTags: ProjectDescription.OnDemandResourcesTags?
        
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
