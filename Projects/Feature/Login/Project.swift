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
    name: "Feature\(Module.Feature.login.rawValue)",
    targets: [
        .feature(
            interface: .login,
            .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .login,
            .init(
                dependencies: [
                    .feature(interface: .login)
                ]
            )
        ),
        .feature(
            testing: .login,
            .init(
                dependencies: [
                    .feature(interface: .login)
                ]
            )
        ),
        .feature(
            tests: .login,
            .init(
                dependencies: [
                    .feature(implements: .login),
                    .feature(testing: .login)
                ]
            )
        ),
        .feature(
            example: .login,
            .init(
                dependencies: [
                    .feature(implements: .login)
                ]
            )
        )
    ]
)
