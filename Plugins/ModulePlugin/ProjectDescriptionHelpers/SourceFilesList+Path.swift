//
//  SourceFileList+Path.swift
//  ModulePlugin
//
//  Created by 박승호 on 1/9/25.
//

import ProjectDescription

public extension ProjectDescription.SourceFilesList {
    static let example: SourceFilesList = "Example/Sources/**"
    static let sources: SourceFilesList = "Sources/**"
    static let interface: SourceFilesList = "Interfaces/Sources/**"
    static let tests: SourceFilesList = "Tests/Sources/**"
    static let testing: SourceFilesList = "Testing/Sources/**"
}
