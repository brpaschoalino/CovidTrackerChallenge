//
//  GetCountryRequest.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation

class GetCountryRequest: Request {
    var url: String = "https://covid19-brazil-api.now.sh/api/report/v1/"

    var method: HTTPMethod = .get

    var responseType: Response.Type = GetCountryDataResponse.self

    public init(countryName: String) {
        self.url = url + countryName
    }
}
