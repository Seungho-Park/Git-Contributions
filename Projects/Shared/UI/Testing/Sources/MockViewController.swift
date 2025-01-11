//
//  MockViewController.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit

public class MockViewController: UIViewController {
    public let controllerId: Int
    private var presentedVC: MockViewController?
    private var presentingVC: MockViewController?
    
    public override var presentedViewController: MockViewController? {
        return presentedVC
    }
    
    public override var presentingViewController: MockViewController? {
        return presentingVC
    }
    
    public init(controllerId: Int) {
        self.controllerId = controllerId
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if let vc = viewControllerToPresent as? MockViewController {
            self.presentedVC = vc
            vc.presentingVC = self
        }
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentingVC?.presentedVC = nil
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
