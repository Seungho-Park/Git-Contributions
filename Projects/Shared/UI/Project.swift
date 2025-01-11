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
    targets: [
        .shared(
            implements: .ui,
            .init(
                dependencies: [
                    .shared(interface: .ui),
                    .external(name: "PinLayout", condition: nil),
                    .external(name: "FlexLayout", condition: nil),
                    .external(name: "RxSwift", condition: nil),
                    .external(name: "RxCocoa", condition: nil)
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
