//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 2/2/25.
//
import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let project = Project.makeModule(
    name: "Feature\(Module.Feature.etc.rawValue)",
    targets: [
        .feature(
            interface: .etc,
            .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .etc,
            .init(
                dependencies: [
                    .feature(interface: .etc)
                ]
            )
        ),
        .feature(
            example: .etc,
            .init(
                dependencies: [
                    .feature(implements: .etc)
                ]
            )
        ),
        .feature(
            testing: .etc,
            .init(
                dependencies: [
                    .feature(interface: .etc)
                ]
            )
        ),
        .feature(
            tests: .etc,
            .init(
                dependencies: [
                    .feature(implements: .etc),
                    .feature(testing: .etc)
                ]
            )
        )
    ]
)
