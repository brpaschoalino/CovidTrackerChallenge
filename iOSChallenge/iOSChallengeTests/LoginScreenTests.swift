//
//  LoginScreenTests.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 07/12/21.
//

import XCTest
import FBSnapshotTestCase
@testable import XcodeGenSample

class LoginScreenTests: FBSnapshotTestCase {

    var sut: LoginViewController!
//    var snapshot = TestUtilities()

//    private var currentViewController: UIViewController!
//    var rootViewController: UIViewController!
//    var baseNavigationController: UINavigationController!
//    var window: UIWindow!

    override func setUp() {
        super.setUp()

//        rootViewController = UIViewController()
//        baseNavigationController = UINavigationController(rootViewController: rootViewController)
//        baseNavigationController.navigationBar.isHidden = true
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = baseNavigationController
//        window.makeKeyAndVisible()

        sut = LoginViewController()

        recordMode = false

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

//        currentViewController = nil
//        rootViewController = nil
//        baseNavigationController = nil
//        window = nil


        sut = nil
    }

//    func setupViewForSnapshot(viewController: UIViewController,
//                   file: StaticString = #file,
//                   line: UInt = #line) {
//        currentViewController = viewController
//        let expect = expectation(description: "finish loading view")
//        viewController.modalPresentationStyle = .fullScreen
//        rootViewController.present(viewController, animated: false, completion: {
//          expect.fulfill()
//        })
//        wait(for: [expect], timeout: 10.0)
//      }
//    func takeSnapshotsForAllScreens(needsWait: Bool = true,
//                      executeBetweenInteractions: (() -> Void)? = nil,
//                      pixelTolerance: CGFloat = 0.01,
//                      overallTolerance: CGFloat = 0.01,
//                      file: StaticString = #file,
//                      line: UInt = #line) {
//        ScreenSize.allCases.forEach { screenSize in
//          window.bounds = screenSize.value
//          currentViewController.view.layoutIfNeeded()
//          window.layoutIfNeeded()
//          executeBetweenInteractions?()
//          FBSnapshotVerifyView(window, identifier: screenSize.rawValue,
//                     perPixelTolerance: pixelTolerance,
//                     overallTolerance: overallTolerance,
//                     file: file,
//                     line: line)
//        }
//      }
//
//    func setupAndTakeSnapshots(viewController: UIViewController,
//                    needsWait: Bool = true,
//                    pixelTolerance: CGFloat = .zero,
//                    overallTolerance: CGFloat = .zero,
//                    file: StaticString = #file,
//                    line: UInt = #line) {
//        setupViewForSnapshot(viewController: viewController, file: file, line: line)
//        takeSnapshotsForAllScreens(needsWait: needsWait,
//                      pixelTolerance: pixelTolerance,
//                      overallTolerance: overallTolerance,
//                      file: file,
//                      line: line)
//      }

    func testDefaultScreen() {
//        setupAndTakeSnapshots(viewController: sut)
        FBSnapshotVerifyViewController(sut)
    }

}
