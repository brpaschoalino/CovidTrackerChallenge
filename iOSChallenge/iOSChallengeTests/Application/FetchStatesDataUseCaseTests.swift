//
//  FetchStatesDataUseCaseTests.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 30/12/21.
//

import Foundation
import XCTest
import PromiseKit
@testable import XcodeGenSample

class FetchStatesDataUseCaseTests: XCTestCase {
    var sut: FetchStatesDataUseCase!
    weak var weakSut: FetchStatesDataUseCase!
    lazy var networkClientProtocolMock: NetworkClientProtocol! = NetworkClientProtocolMock()

    override func setUp() {
        sut = FetchStatesDataUseCase(networkClient: networkClientProtocolMock)
        weakSut = sut
    }

    override func tearDown() {
        sut = nil
        XCTAssertNil(weakSut)
        networkClientProtocolMock = nil
    }

    func testExecuteSuccess() {
        //given
        let networkClientProtocolMock = networkClientProtocolMock as? NetworkClientProtocolMock
        networkClientProtocolMock?.executeHandler = { request in
            let response = GetStatesDataResponseMocked.with()
            return Promise.value(response)
        }
        //when
        let executeExpectation = expectation(description: "Wait execute to finish")
        sut.execute().done { statesData in
            XCTAssertNotNil(statesData)
        }.catch { error in
            XCTFail("Failed with \(error.localizedDescription)")
        }.finally {
            executeExpectation.fulfill()
        }
        wait(for: [executeExpectation], timeout: 5.0)
        //then
        XCTAssertEqual(networkClientProtocolMock?.executeCallCount, 1)
    }

    func testExecuteFailed() {
        //given
        let networkClientProtocolMock = networkClientProtocolMock as? NetworkClientProtocolMock
        networkClientProtocolMock?.executeHandler = { request in
            let getCountryDataResponse = GetCountryDataResponseMocked.with()
            return Promise.value(getCountryDataResponse)
        }
        //when
        let executeExpectation = expectation(description: "Wait execute to finish")
        sut.execute().done { statesData in
            XCTAssertNil(statesData)
        }.catch { error in
            XCTAssertEqual(error as? InfrastructureError, InfrastructureError.badConvertion)
        }.finally {
            executeExpectation.fulfill()
        }
        wait(for: [executeExpectation], timeout: 5.0)
        //then
        XCTAssertEqual(networkClientProtocolMock?.executeCallCount, 1)
    }
}
