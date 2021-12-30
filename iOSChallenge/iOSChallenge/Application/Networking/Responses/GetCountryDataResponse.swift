//
//  GetCountryDataResponse.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation

public class GetCountryDataResponse: Response {

    let country: String?
    let cases: Int?
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?

    public required init(data: Data?) throws {
        guard let data = data else { throw NetworkError.badResponse }
        guard let countryData = try?JSONDecoder().decode(JSONCountryData.self, from: data) else { throw NetworkError.badResponse }
        self.country = countryData.data.country
        self.cases = countryData.data.cases
        self.confirmed = countryData.data.confirmed
        self.deaths = countryData.data.deaths
        self.recovered = countryData.data.recovered
    }
}

struct JSONCountryData: Codable {

    struct CountryData: Codable {

    let country: String?
    let cases: Int?
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?
    let lastUpdate: String?

    enum CodingKeys: String, CodingKey{
        case country
        case cases
        case confirmed
        case deaths
        case recovered
        case lastUpdate = "updated_at"
    }
    }

    let data: CountryData
}
