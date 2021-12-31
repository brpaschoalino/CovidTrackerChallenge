//
//  GetCountryDataResponseMocked.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 30/12/21.
//

import Foundation
@testable import XcodeGenSample

struct GetCountryDataResponseMocked {
    static func with() -> GetCountryDataResponse {
        let responseData = #"""
{
  "data": {
    "country": "Brazil",
    "cases": 1001,
    "confirmed": 1021,
    "deaths": 18,
    "recovered": 2,
    "updated_at": "2020-03-22T02:13:13.000Z"
  }
}
"""#.data(using: .utf8) ?? Data()
        guard let response = try? GetCountryDataResponse(data: responseData) else { fatalError("Failed to create GetCountryDataResponseMocked")}
        return response
    }
}
