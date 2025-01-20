//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/20/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project = Project.makeModule(
    name: "Shared\(Module.Shared.storage.rawValue)",
    targets: [
        .shared(
            implements: .storage,
            .init(
                dependencies: [],
                coreDataModels: [
                    .coreDataModel(.relativeToManifest("Sources/CoreDataStorage.xcdatamodeld"))
                ]
            )
        )
    ]
)
