//
//  LoginScreenTests.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 07/12/21.
//

import XCTest
import FBSnapshotTestCase
@testable import XcodeGenSample

class LoginScreenTests: BaseSnapShotTest {

    override func setUp() {
        super.setUp()

        recordMode = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDefaultScreen() {
        let viewController: UIViewController = UIStoryboard(name: "LoginStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
                setupAndTakeSnapshots(viewController: viewController)
    }
}
