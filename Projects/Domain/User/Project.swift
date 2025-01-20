//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/20/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project: Project = .makeModule(
    name: "Domain\(Module.Domain.user.rawValue)",
    targets: [
        .domain(
            interface: .user,
                .init(
                    
                )
        ),
        .domain(
            implements: .user,
                .init(
                    dependencies: [
                        .domain(interface: .user)
                    ]
                )
        ),
        .domain(
            testing: .user,
                .init(
                    dependencies: [
                        .domain(interface: .user)
                    ]
                )
        ),
        .domain(tests: .user, .init(
            dependencies: [
                .domain(implements: .user),
                .domain(testing: .user)
            ]
            
        ))
    ]
)
