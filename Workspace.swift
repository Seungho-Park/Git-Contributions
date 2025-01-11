//
//  Workspace.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ModulePlugin

let workspace = Workspace(
    name: "Git-Contributions",
    projects: [
        .application
    ],
    additionalFiles: [.glob(pattern: .relativeToRoot("README.md"))]
)
