//
//  FetchCountryDataUseCase.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import PromiseKit

class FetchCountryDataUseCase {
    private var service = HTTPNetworkClient.shared

    func execute(country: String) -> Promise<CovidCountryData> {
        let request = GetCountryRequest(countryName: country)
        return service.execute(request: request).then { response -> Promise<CovidCountryData> in
            if let getCountryResponse = response as? GetCountryDataResponse {
                let covidCountryData = CovidCountryData(country: getCountryResponse.country,
                                                        cases: getCountryResponse.cases,
                                                        confirmed: getCountryResponse.confirmed,
                                                        deaths: getCountryResponse.deaths,
                                                        recovered: getCountryResponse.recovered)
                return Promise.value(covidCountryData)
            }
            return Promise.init(error: InfrastructureError.badConvertion)
        }

    }
    
}
