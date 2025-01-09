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
    @frozen enum Feature {
        
    }
}

public extension Module {
    @frozen enum Domain {
        
    }
}

public extension Module {
    @frozen enum Core {
        
    }
}

public extension Module {
    @frozen enum Shared {
        
    }
}
