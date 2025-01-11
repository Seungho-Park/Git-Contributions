//
//  CoordinatorTests.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

import UIKit
import XCTest
import SharedUITesting

final class CoordinatorTests: XCTestCase {
    func testCoordinator_WhenCallStart_ShouldPushNavigationStackIdOne() {
        //given
        let coordinator = MockCoordinator(navigationController: UINavigationController())
        
        //when
        coordinator.start()
        
        //then
        XCTAssertEqual(coordinator.navigationController.viewControllers.count, 1)
        if let vc = coordinator.navigationController.topViewController as? MockViewController {
            XCTAssertEqual(vc.controllerId, 1)
        } else {
            XCTFail("Start VC should be MockViewController")
        }
    }
    
    func testCoordinator_WhenTransitionRootViewController_ShouldNavigationStackCountOneAndControllerIdTwo() {
        //given
        let coordinator = MockCoordinator(navigationController: UINavigationController())
        coordinator.start()
        
        //when
        XCTAssertTrue(checkControllerId(viewController: coordinator.navigationController.topViewController, targetId: 1))
        coordinator.transition(scene: MockScene.rootScene, style: .root, animated: false)
        
        //then
        XCTAssertEqual(coordinator.navigationController.viewControllers.count, 1)
        XCTAssertTrue(checkControllerId(viewController: coordinator.navigationController.topViewController, targetId: 2))
    }
    
    func testCoordinator_WhenTransitionPushViewController_ShouldNavigationStackCountTwoAndControllerIdThree() {
        //given
        let coordinator = MockCoordinator(navigationController: UINavigationController())
        coordinator.start()
        
        //when
        XCTAssertTrue(checkControllerId(viewController: coordinator.navigationController.topViewController, targetId: 1))
        coordinator.transition(scene: MockScene.pushScene, style: .push, animated: false)
        
        //then
        XCTAssertEqual(coordinator.navigationController.viewControllers.count, 2)
        XCTAssertTrue(checkControllerId(viewController: coordinator.navigationController.topViewController, targetId: 3))
    }
    
    private func checkControllerId(viewController: UIViewController?, targetId: Int)-> Bool {
        if let vc = viewController as? MockViewController {
            return vc.controllerId == targetId
        } else {
            XCTFail("ViewController Should be MockViewController")
        }
        
        return false
    }
}
