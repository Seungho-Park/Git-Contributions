//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/21/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Feature\(Module.Feature.home.rawValue)",
    targets: [
        .feature(
            interface: .home,
            .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .home,
            .init(
                dependencies: [
                    .feature(interface: .home)
                ]
            )
        ),
        .feature(
            testing: .home,
            .init(
                dependencies: [
                    .feature(interface: .home)
                ]
            )
        ),
        .feature(
            tests: .home,
            .init(
                dependencies: [
                    .feature(implements: .home),
                    .feature(testing: .home)
                ]
            )
        ),
        .feature(
            example: .home,
            .init(
                dependencies: [
                    .feature(implements: .home)
                ]
            )
        )
    ]
)
