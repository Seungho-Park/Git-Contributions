//
//  BaseViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import UIKit

class BaseViewController<T>: UIViewController, ViewModelBindable {
    lazy var tag = "\(Self.self)"
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Log.i(tag, message: "viewDidLoad()")
    }
    
    func bind() {
        
    }
}
