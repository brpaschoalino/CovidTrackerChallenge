//
//  Data.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 10/12/21.
//

import Foundation

public class GetStatesDataResponse: Response {

    let stateDataList: [StatesData]

    public required init(data: Data?) throws {
        guard let data = data else { throw NetworkError.badResponse }
        guard let statesData = try?JSONDecoder().decode(GetStatesSuccessResponse.self, from: data) else { return }
    }
}

struct GetStatesSuccessResponse: Codable {
    var data: [StatesData]
}
