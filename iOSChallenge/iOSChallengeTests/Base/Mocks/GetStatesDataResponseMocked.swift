//
//  GetStatesDataResponseMocked.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 30/12/21.
//

import Foundation
@testable import XcodeGenSample

struct GetStatesDataResponseMocked {
    static func with() -> GetStatesDataResponse {
        let responseData = #"""
{
  "data": [
    {
      "uid": 11,
      "uf": "Rondônia",
      "state": "RO",
      "cases": 0,
      "deaths": 0,
      "suspects": 61,
      "refuses": 2,
      "broadcast": false,
      "comments": "",
      "datetime": "2020-03-18T23:00:00.000Z"
    }
   ]
}
"""#.data(using: .utf8) ?? Data()
        guard let response = try? GetStatesDataResponse(data: responseData) else { fatalError("Failed to create GetStatesDataResponseMocked") }

        return response

    }
}
