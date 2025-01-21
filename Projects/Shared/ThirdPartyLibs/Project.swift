//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/21/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin
import ThirdPartyDependency

let project: Project = .makeModule(
    name: "Shared\(Module.Shared.thirdPartyLibs.rawValue)",
    targets: [
        .shared(
            implements: .thirdPartyLibs,
            .init(
                dependencies: [
                    .SPM.RxSwift,
                    .SPM.RxCocoa
                ]
            )
        )
    ]
)
