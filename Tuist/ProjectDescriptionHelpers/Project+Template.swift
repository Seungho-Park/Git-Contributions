//
//  Project+Template.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ModulePlugin

public extension ProjectDescription.Project {
    static func makeModule(
        name: String,
        organizationName: String = Project.Environment.organizationName,
        classPrefix: String? = nil,
        options: ProjectDescription.Project.Options = .options(),
        packages: [ProjectDescription.Package] = [],
        settings: ProjectDescription.Settings? = nil,
        targets: [ProjectDescription.Target] = [],
        schemes: [ProjectDescription.Scheme] = [],
        fileHeaderTemplate: ProjectDescription.FileHeaderTemplate? = nil,
        additionalFiles: [ProjectDescription.FileElement] = [],
        resourceSynthesizers: [ProjectDescription.ResourceSynthesizer] = .default
    )-> Self {
        return .init(
            name: name,
            organizationName: organizationName,
            classPrefix: classPrefix,
            options: options,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,
            fileHeaderTemplate: fileHeaderTemplate,
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}
