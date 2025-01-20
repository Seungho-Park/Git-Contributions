//
//  Bundle+Extension.swift
//  SharedStorage
//
//  Created by 박승호 on 1/20/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation

public extension Bundle {
    static var storage: Bundle {
        return Bundle.module
    }
}
