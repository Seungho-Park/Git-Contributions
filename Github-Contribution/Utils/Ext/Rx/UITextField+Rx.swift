//
//  UITextField+Rx.swift
//  Github-Contribution
//
//  Created by 박승호 on 11/11/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {
    var tap: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.gestureRecognizerShouldBegin(_:))).map { _ in }
        return ControlEvent(events: source)
    }
}
