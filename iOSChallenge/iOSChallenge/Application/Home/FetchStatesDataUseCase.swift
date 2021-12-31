//
//  StatesDataRequest.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 19/12/21.
//

import Foundation
import PromiseKit

class FetchStatesDataUseCase {

    private var service: NetworkClientProtocol

    public init(networkClient: NetworkClientProtocol = HTTPNetworkClient.shared) {
        service = networkClient
    }

    func execute() -> Promise<[StatesData]> {
        let request = GetStatesRequest()
        return service.execute(request: request).then { response -> Promise<[StatesData]> in
            if let getStateResponse = response as? GetStatesDataResponse {
                return Promise.value(getStateResponse.stateDataList)
            }
            return Promise.init(error: InfrastructureError.badConvertion)
        }
    }
}
