//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Application",
    organizationName: "",
    targets: [
        .application(
            .init(
                name: "Application",
                bundleId: "",
                dependencies: [
                    .feature
                ]
            )
        )
    ]
)
