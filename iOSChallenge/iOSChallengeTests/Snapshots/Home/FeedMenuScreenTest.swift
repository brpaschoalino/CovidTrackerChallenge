//
//  FeedMenuScreenTest.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 23/12/21.
//

import XCTest
@testable import XcodeGenSample
import FBSnapshotTestCase

class FeedMenuScreenTest: BaseSnapShotTest {

    private let statesDataMock = StatesDataMocked.with()

    override func setUp() {
        super.setUp()

        recordMode = true
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCell() {
        let container = TableViewCellSnapshotContainer<StatesTableViewCell>(width: 375, configureCell: { cell in
            cell.stateUf?.text = self.statesDataMock.uf
            cell.stateState?.text = self.statesDataMock.state
            cell.stateCases?.text = "\(self.statesDataMock.cases)"
            cell.stateSuspects?.text = "\(self.statesDataMock.suspects)"
            cell.stateDeaths?.text = "\(self.statesDataMock.deaths)"
        })

        FBSnapshotVerifyView(container)
    }

}
