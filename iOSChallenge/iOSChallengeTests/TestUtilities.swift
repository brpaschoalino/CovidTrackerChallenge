//
//  TestUtilities.swift
//  XcodeGenSampleTestss
//
//  Created by Bruno Rodrigues Paschoalino on 07/12/21.
//

import XCTest
import FBSnapshotTestCase
import UIKit

class BaseSnapShotTest: FBSnapshotTestCase {

    private var currentViewController: UIViewController!
    var rootViewController: UIViewController!
    var baseNavigationController: UINavigationController!
    var window: UIWindow!

    override func setUp() {
        super.setUp()

        rootViewController = UIViewController()
        baseNavigationController = UINavigationController(rootViewController: rootViewController)
        baseNavigationController.navigationBar.isHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = baseNavigationController
        window.makeKeyAndVisible()

    }

    override func tearDown() {
        currentViewController = nil
        rootViewController = nil
        baseNavigationController = nil
        window = nil
    }

    func setupViewForSnapshot(viewController: UIViewController,
                   file: StaticString = #file,
                   line: UInt = #line) {
        currentViewController = viewController
        let expect = expectation(description: "finish loading view")
        viewController.modalPresentationStyle = .fullScreen
        rootViewController.present(viewController, animated: false, completion: {
          expect.fulfill()
        })
        wait(for: [expect], timeout: 10.0)
      }

    func takeSnapshotsForAllScreens(needsWait: Bool = true,
                      executeBetweenInteractions: (() -> Void)? = nil,
                      pixelTolerance: CGFloat = 0.01,
                      overallTolerance: CGFloat = 0.01,
                      file: StaticString = #file,
                      line: UInt = #line) {
        if needsWait {
            waitBeforeContinue(time: 2.0)
        }
        ScreenSize.allCases.forEach { screenSize in
          window.bounds = screenSize.value
          currentViewController.view.layoutIfNeeded()
          window.layoutIfNeeded()
          executeBetweenInteractions?()
          FBSnapshotVerifyView(window, identifier: screenSize.rawValue,
                     perPixelTolerance: pixelTolerance,
                     overallTolerance: overallTolerance,
                     file: file,
                     line: line)
        }
      }

    func setupAndTakeSnapshots(viewController: UIViewController,
                    needsWait: Bool = true,
                    pixelTolerance: CGFloat = .zero,
                    overallTolerance: CGFloat = .zero,
                    file: StaticString = #file,
                    line: UInt = #line) {
        setupViewForSnapshot(viewController: viewController, file: file, line: line)
        takeSnapshotsForAllScreens(needsWait: needsWait,
                      pixelTolerance: pixelTolerance,
                      overallTolerance: overallTolerance,
                      file: file,
                      line: line)
      }
}

extension FBSnapshotTestCase {

    func waitBeforeContinue(time: TimeInterval = 5) {
        let expect = expectation(description: "wait before continue")
        _ = XCTWaiter.wait(for: [expect], timeout: time)
    }
}
