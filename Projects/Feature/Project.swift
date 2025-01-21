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
    name: "Feature",
    targets: [
        .feature(
            .init(
                dependencies: [
                    .domain,
                    .feature(implements: .splash),
                    .feature(implements: .login),
                    .feature(implements: .home)
                ]
            )
        )
    ]
)
