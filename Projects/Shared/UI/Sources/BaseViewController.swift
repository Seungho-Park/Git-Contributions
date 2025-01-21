//
//  BaseViewController.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUIInterface
import RxSwift

open class BaseViewController<VM: ViewModel>: UIViewController, ViewModelBinable {
    internal var disposeBag = DisposeBag()
    public static var isDebug: Bool { return true }
    
    public var viewModel: VM!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        if Self.isDebug {
            print("\(Self.self): \(#function)")
        }
        #endif
        
        bind()
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
    
    open func bind() {
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
