//
//  BaseViewController.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import SharedUIInterface

open class BaseViewController<T: ViewModel>: UIViewController, ViewModelBinable {
    public var viewModel: T!
    
    public func bind() {
        
    }
}
