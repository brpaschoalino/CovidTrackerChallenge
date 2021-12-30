//
//  NetworkClientProtocolMock.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 30/12/21.
//

import Foundation
import PromiseKit
@testable import XcodeGenSample

class NetworkClientProtocolMock: NetworkClientProtocol {
    static var shared: NetworkClientProtocol = NetworkClientProtocolMock()

    public private(set) var executeCallCount = 0
    public var executeHandler: ((_: Request) -> Promise<Response>)?

    func execute(request: Request) -> Promise<Response> {
        executeCallCount += 1
        if let executeHandler = executeHandler {
            return executeHandler(request)
        }
        fatalError("Execute Handler must be set")
    }


}
