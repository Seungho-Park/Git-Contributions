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
                    .shared(interface: .ui)
                ]
            )
        ),
        .shared(
            interface: .ui,
            .init(
                dependencies: [
                    .SPM.FlexLayout,
                    .SPM.PinLayout,
                    .SPM.RxSwift,
                    .SPM.RxCocoa
                ]
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
