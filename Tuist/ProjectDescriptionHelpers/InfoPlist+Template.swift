//
//  InfoPlist+Template.swift
//  Manifests
//
//  Created by 박승호 on 1/18/25.
//

import ProjectDescription

public extension ProjectDescription.InfoPlist {
    static let example: Self = {
        return .dictionary(
            [
                "CFBundleName": "$(PRODUCT_NAME)",
                "CFBundleDisplayName": "$(PRODUCT_NAME)",
                "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
                "CFBundleInfoDictionaryVersion": "6.0",
                "CFBundleShortVersionString": "1.0",
                "CFBundleVersion": "1",
                "CFBundleExecutable": "$(EXECUTABLE_NAME)",
                "UIApplicationSceneManifest": [
                    "UIApplicationSupportsMultipleScenes": false,
                    "UISceneConfigurations": [
                        "UIWindowSceneSessionRoleApplication": [
                            [
                                "UISceneConfigurationName": "Default Configuration",
                                "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                             ]
                        ]
                    ]
                ]
            ]
        )
    }()
}
