//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/11/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Shared\(Module.Shared.ui.rawValue)",
    organizationName: "",
    targets: [
        .shared(
            implements: .ui,
            .init(
                name: "Shared\(Module.Shared.ui.rawValue)",
                bundleId: "",
                dependencies: [
                    .shared(interface: .ui)
                ]
            )
        ),
        .shared(
            interface: .ui,
            .init(
                name: "Shared\(Module.Shared.ui.rawValue)Interface",
                bundleId: ""
            )
        ),
        .shared(
            testing: .ui,
            .init(
                name: "Shared\(Module.Shared.ui.rawValue)Testing",
                bundleId: ""
            )
        ),
        .shared(
            tests: .ui,
            .init(
                name: "Shared\(Module.Shared.ui.rawValue)Tests",
                bundleId: "",
                dependencies: [
                    .shared(testing: .ui),
                    .shared(implements: .ui)
                ]
            )
        )
    ]
)
