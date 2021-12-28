//
//  TestStatesDataRequest.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 22/12/21.
//

import XCTest
import Mocker
import Alamofire
@testable import XcodeGenSample

class TestStatesDataRequest: XCTestCase {

    func testStatesDataFetching() throws {
        let statesDataMock = StatesDataMocked.with()
        let config = URLSessionConfiguration.af.default
        config.protocolClasses = [MockingURLProtocol.self] + (config.protocolClasses ?? [])
        let sessionManager = Session(configuration: config)

        guard let apiEndPoint = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1/brazil/20200318") else { return }
        let requestExpectation = expectation(description: "Request should finish")

        let mockedData = try! JSONEncoder().encode(statesDataMock)
        let mock = Mock(url: apiEndPoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        sessionManager
            .request(apiEndPoint)
            .responseDecodable(of: StatesData.self) { (response) in
                XCTAssertNil(response.error)
                XCTAssertEqual(response.value, statesDataMock)
                requestExpectation.fulfill()
            }.resume()
        wait(for: [requestExpectation], timeout: 10.0)
    }

}
