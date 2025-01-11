//
//  ViewModelBinable.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit

public protocol ViewModelBinable: NSObjectProtocol {
    associatedtype ViewModel
    
    var viewModel: ViewModel! { get set }
    
    func bind()
}

extension ViewModelBinable where Self: UIViewController {
    public static func create(viewModel: ViewModel)-> Self {
        let viewController = Self()
        viewController.viewModel = viewModel
        return viewController
    }
}
