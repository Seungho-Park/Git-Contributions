//
//  MockViewController.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit

public class MockViewController: UIViewController {
    public let controllerId: Int
    
    public init(controllerId: Int) {
        self.controllerId = controllerId
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
