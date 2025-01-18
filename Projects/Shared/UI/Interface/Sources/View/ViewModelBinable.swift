//
//  ViewModelBinable.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit

public protocol ViewModelBinable: NSObjectProtocol {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bind()
}

extension ViewModelBinable where Self: UIViewController {
    public static func create(viewModel: ViewModelType)-> Self {
        let viewController = Self()
        viewController.viewModel = viewModel
        return viewController
    }
}
