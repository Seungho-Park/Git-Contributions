//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .makeModule(
    name: "Shared",
    organizationName: "",
    targets: [
        .shared(
            .init(
                name: "Shared",
                bundleId: ""
            )
        )
    ]
)
