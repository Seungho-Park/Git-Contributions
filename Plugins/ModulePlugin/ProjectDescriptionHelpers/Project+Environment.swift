//
//  Project+Environment.swift
//  ModulePlugin
//
//  Created by 박승호 on 1/11/25.
//

import ProjectDescription

public extension Project {
    enum Environment {
        public static let appName = "Git-Contributions"
        public static let deploymentTarget: DeploymentTargets = .iOS("15.0")
        public static let bundlePrefix = "net.devswift.git-contributions"
        public static let organizationName = "Seungho-Park"
    }
}
