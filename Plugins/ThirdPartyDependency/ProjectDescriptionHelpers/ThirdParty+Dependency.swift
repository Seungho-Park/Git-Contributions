//
//  ThirdParty+Dependency.swift
//  ModulePlugin
//
//  Created by 박승호 on 1/12/25.
//

import ProjectDescription

public extension ProjectDescription.TargetDependency {
    enum SPM {
        public static let RxSwift: ProjectDescription.TargetDependency = .external(name: "RxSwift")
        public static let RxCocoa: ProjectDescription.TargetDependency = .external(name: "RxCocoa")
        public static let RxRelay: ProjectDescription.TargetDependency = .external(name: "RxRelay")
        public static let FlexLayout: ProjectDescription.TargetDependency = .external(name: "FlexLayout")
        public static let PinLayout: ProjectDescription.TargetDependency = .external(name: "PinLayout")
    }
}
