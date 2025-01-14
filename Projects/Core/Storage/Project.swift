//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/14/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Core\(Module.Core.storage.rawValue)",
    targets: [
        .core(
            interface: .storage,
            .init()
        ),
        .core(
            implements: .storage,
            .init(
                dependencies: [
                    .core(interface: .storage)
                ],
                coreDataModels: [
                    .coreDataModel(.relativeToManifest("Sources/CoreDataStorage.xcdatamodeld"))
                ]
            )
        ),
        .core(
            testing: .storage,
                .init(
                    dependencies: [
                        .core(interface: .storage)
                    ]
                )
        ),
        .core(
            tests: .storage,
            .init(
                dependencies: [
                    .core(testing: .storage),
                    .core(implements: .storage)
                ]
            )
        )
    ]
)
