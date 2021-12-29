//
//  GetStatesRequest.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 28/12/21.
//

import Foundation

class GetStatesRequest: Request {
    var url: String = "https://covid19-brazil-api.now.sh/api/report/v1/brazil/20200318"

    var method: HTTPMethod = .get

    var responseType: Response.Type = GetStatesDataResponse.self


}
