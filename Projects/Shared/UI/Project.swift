//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/11/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin
import ThirdPartyDependency

let project: Project = .makeModule(
    name: "Shared\(Module.Shared.ui.rawValue)",
    targets: [
        .shared(
            implements: .ui,
            .init(
                dependencies: [
                    .shared(interface: .ui),
                    .spm(.rxSwift),
                    .spm(.rxCocoa),
                    .spm(.pinLayout),
                    .spm(.flexLayout)
                ]
            )
        ),
        .shared(
            interface: .ui,
            .init(
                
            )
        ),
        .shared(
            testing: .ui,
            .init(
                dependencies: [
                    .shared(interface: .ui)
                ]
            )
        ),
        .shared(
            tests: .ui,
            .init(
                dependencies: [
                    .shared(testing: .ui),
                    .shared(implements: .ui)
                ]
            )
        )
    ]
)
