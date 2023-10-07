//
//  Log.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation

final class Log {
    private static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss.SSS"
        df.locale = Locale.current
        return df
    }()
    
    private static func now()-> String {
        return dateFormatter.string(from: Date())
    }
    
    static func d(_ tag: String, message: String) {
        #if DEBUG
        print("🩶[\(now()) \(tag)] \(message)")
        #endif
    }
    
    static func e(_ tag: String, message: String) {
        #if DEBUG
        print("❤️[\(now()) \(tag)] \(message)")
        #endif
    }
    
    static func w(_ tag: String, message: String) {
        #if DEBUG
        print("💛[\(now()) \(tag)] \(message)")
        #endif
    }
    
    static func i(_ tag: String, message: String) {
        #if DEBUG
        print("🤍[\(now()) \(tag)] \(message)")
        #endif
    }
}
