//
//  CountryData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation

class CovidCountryData {
    let country: String?
    let cases: Int?
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?

    public init(country: String?,
                cases: Int?,
                confirmed: Int?,
                deaths: Int?,
                recovered: Int?) {
        self.country = country
        self.cases = cases
        self.confirmed = confirmed
        self.deaths = deaths
        self.recovered = recovered
    }
}
