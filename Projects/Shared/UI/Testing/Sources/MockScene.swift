//
//  MockScene.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//
import UIKit
import SharedUIInterface

public enum MockScene: Scene {
    case rootScene
    case pushScene
    
    public func instaintiate() -> UIViewController {
        switch self {
        case .rootScene:
            return MockViewController(controllerId: 2)
        case .pushScene:
            return MockViewController(controllerId: 3)
        }
    }
}
