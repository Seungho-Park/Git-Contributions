//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/16/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Core\(Module.Core.network.rawValue)",
    targets: [
        .core(
            interface: .network,
                .init(
                    dependencies: [
                        .shared
                    ]
                )
        ),
        .core(
            implements: .network,
            .init(
                dependencies: [
                    .core(interface: .network)
                ]
            )
        ),
        .core(
            testing: .network,
            .init(
                dependencies: [
                    .core(interface: .network)
                ]
            )
        ),
        .core(tests: .network, .init(
            dependencies: [
                .core(testing: .network),
                .core(implements: .network)
            ]
        ))
    ]
)
