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
    organizationName: "",
    targets: [
        .feature(
            example: .splash,
            .init(
                name: "Feature\(Module.Feature.splash.rawValue)Example",
                bundleId: "",
                dependencies: [
                    .feature(implements: .splash)
                ]
            )
        ),
        .feature(
            tests: .splash,
            .init(
                name: "Feature\(Module.Feature.splash.rawValue)Tests",
                bundleId: "",
                dependencies: [
                    .feature(implements: .splash),
                    .feature(testing: .splash)
                ]
            )
        ),
        .feature(
            implements: .splash,
            .init(
                name: "Feature\(Module.Feature.splash.rawValue)",
                bundleId: "",
                dependencies: [
                    .feature(interface: .splash)
                ]
            )
        ),
        .feature(
            testing: .splash,
            .init(
                name: "Feature\(Module.Feature.splash.rawValue)Testing",
                bundleId: "",
                dependencies: [
                    .feature(interface: .splash)
                ]
            )
        ),
        .feature(
            interface: .splash,
            .init(
                name: "Feature\(Module.Feature.splash.rawValue)Interface",
                bundleId: "",
                dependencies: [
//                    .core
                ]
            )
        )
    ]
)
