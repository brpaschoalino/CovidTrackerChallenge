//
//  FetchCountriesUseCase.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import PromiseKit

class FetchCountriesUseCase {
    func execute() -> Promise<[Country]>{
        let database = Database()
        let countryRepository = SQLCountryRepository(connection: database.connection)
        return countryRepository.fetchCountryData()
    }
}
