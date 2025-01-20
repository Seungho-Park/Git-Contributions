//
//  Module.swift
//  Manifests
//
//  Created by 박승호 on 1/9/25.
//

@frozen
public enum Module {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
}

public extension Module {
    @frozen enum Feature: String {
        case splash = "Splash"
    }
}

public extension Module {
    @frozen enum Domain: String {
        case user = "User"
    }
}

public extension Module {
    @frozen enum Core: String {
        case network = "Network"
        case storage = "Storage"
    }
}

public extension Module {
    @frozen enum Shared: String {
        case ui = "UI"
        case utils = "Utils"
        case storage = "Storage"
        case thirdPartyLibs = "ThirdPartyLibs"
    }
}
