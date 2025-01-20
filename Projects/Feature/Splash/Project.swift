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
    name: "Feature\(Module.Feature.splash.rawValue)",
    targets: [
        .feature(
            example: .splash,
            .init(
                dependencies: [
                    .feature(implements: .splash)
                ]
            )
        ),
        .feature(
            tests: .splash,
            .init(
                dependencies: [
                    .feature(implements: .splash),
                    .feature(testing: .splash)
                ]
            )
        ),
        .feature(
            implements: .splash,
            .init(
                dependencies: [
                    .feature(interface: .splash)
                ]
            )
        ),
        .feature(
            testing: .splash,
            .init(
                dependencies: [
                    .feature(interface: .splash)
                ]
            )
        ),
        .feature(
            interface: .splash,
            .init(
                dependencies: [
                    .domain
                ]
            )
        )
    ]
)
