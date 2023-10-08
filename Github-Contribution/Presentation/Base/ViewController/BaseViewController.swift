//
//  BaseViewController.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class BaseViewController<T: ViewModel>: UIViewController, ViewModelBindable {
    lazy var tag = "\(Self.self)"
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Log.i(tag, message: "viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Log.i(tag, message: "viewWillAppear(_ animated: \(animated))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Log.i(tag, message: "viewDidAppear(_ animated: \(animated))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Log.i(tag, message: "viewWillDisappear(_ animated: \(animated))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        Log.i(tag, message: "viewDidDisappear(_ animated: \(animated)")
    }
    
    func bind() {
        viewModel.backgroundColor
            .map { UIColor(named: $0) }
            .drive(self.view.rx.backgroundColor)
            .disposed(by: rx.disposeBag)
        
        viewModel.title
            .drive(self.navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
    }
}
