//
//  ViewModelBindable.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import UIKit

protocol ViewModelBindable {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bind()
}

extension ViewModelBindable where Self: UIViewController {
    static func create(viewModel: ViewModelType)-> Self {
        var vc = Self.init()
        vc.bindViewModel(viewModel: viewModel)
        
        return vc
    }
    
    private mutating func bindViewModel(viewModel: ViewModelType) {
        self.viewModel = viewModel
        self.loadViewIfNeeded()
        
        self.bind()
    }
}
