//
//  ThirdParty+Dependency.swift
//  ModulePlugin
//
//  Created by 박승호 on 1/12/25.
//

import ProjectDescription

public extension ProjectDescription.TargetDependency {
    enum SPM {
        case rxSwift
        case rxCocoa
        case flexLayout
        case pinLayout
    }
    
    static func spm(_ type: SPM)-> TargetDependency {
        switch type {
        case .rxSwift: return .external(name: "RxSwift")
        case .rxCocoa: return .external(name: "RxCocoa")
        case .flexLayout: return .external(name: "FlexLayout")
        case .pinLayout: return .external(name: "PinLayout")
        }
    }
}
