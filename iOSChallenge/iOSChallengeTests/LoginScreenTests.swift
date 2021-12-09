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

    var sut: LoginViewController!

    override func setUp() {
        super.setUp()

        sut = LoginViewController()

        recordMode = true

    }

    override func tearDown() {
        sut = nil
    }

    func testDefaultScreen() {
        setupAndTakeSnapshots(viewController: sut)
    }

}
