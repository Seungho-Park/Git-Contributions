//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .makeModule(
    name: "Core",
    targets: [
        .core(
            .init(
                dependencies: [
                    .shared,
                    .core(implements: .storage),
                    .core(implements: .network)
                ]
            )
        )
    ]
)
