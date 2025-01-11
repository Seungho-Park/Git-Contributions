//
//  BaseViewController.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUIInterface

open class BaseViewController<T: ViewModel>: UIViewController, ViewModelBinable {
    public static var isDebug: Bool { return true }
    
    public var viewModel: T!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
    }
    
    public func bind() {
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
        
    }
    
    deinit {
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
    }
}
