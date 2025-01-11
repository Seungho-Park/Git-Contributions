//
//  Project.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ModulePlugin

let settings: SettingsDictionary = [
    "INFOPLIST_KEY_CFBundleDisplayName": "Git-Contributions",
    "INFOPLIST_KEY_LSApplicationCategoryType": "public.app-category.utilities",
    "CURRENT_PROJECT_VERSION": "1",
    "MARKETING_VERSION": "1.0.0",
    "OTHER_LDFLAGS": [
        "$(inherited) -ObjC"
    ]
]

let project: Project = .makeModule(
    name: "Git-Contributions",
    settings: .settings(base: settings),
    targets: [
        .application(
            .init(
                infoPlist: .file(path: .relativeToCurrentFile("SupportingFiles/Info.plist")),
                resources: ["Resources/**"],
                dependencies: [
                    .feature
                ]
            )
        )
    ]
)
