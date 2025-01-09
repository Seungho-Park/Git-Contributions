//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project = Project(
    name: "Feature",
    targets: [
        .feature(
            .init(
                name: "Feature",
                bundleId: "",
                dependencies: [
                    .domain,
                    .feature(implements: .splash)
                ]
            )
        )
    ]
)
