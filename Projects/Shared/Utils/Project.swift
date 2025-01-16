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
    name: "Shared\(Module.Shared.utils.rawValue)",
    targets: [
        .shared(interface: .utils, .init()),
        .shared(
            implements: .utils,
            .init(
                dependencies: [
                    .shared(interface: .utils)
                ]
            )
        ),
        .shared(tests: .utils, .init(dependencies: [.shared(implements: .utils)]))
    ]
)
