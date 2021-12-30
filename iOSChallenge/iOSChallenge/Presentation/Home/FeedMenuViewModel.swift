//
//  FeedMenuViewModel.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import Combine
import PromiseKit

public extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class FeedMenuViewModel: ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()

    private var statesData = [StatesData]()
    private var countriesData = [Country]()
    private var countryData = CovidCountryData(country: "",
                                               cases: 0,
                                               confirmed: 0,
                                               deaths: 0,
                                               recovered: 0)

    private var selectedCountry: Int = 0

    private var error: Error?

    private let fetchStatesDataUseCase: FetchStatesDataUseCase
    private let fetchCountriesDataUseCase: FetchCountriesUseCase
    private let fetchCountryDataUseCase: FetchCountryDataUseCase

    init(fetchStatesDataUseCase: FetchStatesDataUseCase = FetchStatesDataUseCase(),
         fetchCountriesDataUseCase: FetchCountriesUseCase = FetchCountriesUseCase(),
         fetchCountryDataUseCase: FetchCountryDataUseCase = FetchCountryDataUseCase()) {
        self.fetchStatesDataUseCase = fetchStatesDataUseCase
        self.fetchCountriesDataUseCase = fetchCountriesDataUseCase
        self.fetchCountryDataUseCase = fetchCountryDataUseCase
    }

    func loadData() {

        fetchStatesDataUseCase.execute().then { statesData -> Promise<[Country]> in
            self.statesData = statesData
            return self.fetchCountriesDataUseCase.execute()
        }.then { countriesData -> Promise<CovidCountryData> in
            self.countriesData = countriesData
            return self.fetchCountryDataUseCase.execute(country: self.getCountryApiKey(index: self.selectedCountry))
        }.done { countryData in
            self.countryData = countryData
        }.catch { error in
            print(error.localizedDescription)
            self.error = error
        }.finally {
            self.objectWillChange.send()
        }

    }

//    func loadStatesData() {
//        fetchStatesDataUseCase.execute().done { statesData in
//            self.statesData = statesData
//        }.catch { error in
//            print(error.localizedDescription)
//            self.error = error
//        }.finally {
//            self.objectWillChange.send()
//        }
//    }
//
//    func loadCountriesData() {
//        fetchCountriesDataUseCase.execute().done { countriesData in
//            self.countriesData = countriesData
//        }.catch { error in
//            print(error.localizedDescription)
//            self.error = error
//        }.finally {
//            self.objectWillChange.send()
//            self.loadCountryData()
//        }
//    }

    func loadCountryData() {

        fetchCountryDataUseCase.execute(country: getCountryApiKey(index: selectedCountry)).done { countryData in
            self.countryData = countryData
        }.catch { error in
            print(error.localizedDescription)
            self.error = error
        }.finally {
            self.objectWillChange.send()
        }
    }

    func getStateUF(index: Int) -> String {
        print("Getting state uf")
        return statesData[index].uf
    }

    func getState(index: Int) -> String {
        print("Getting state name")
        return statesData[index].state
    }

    func getStateCases(index: Int) -> Int {
        print("Getting state cases")
        return statesData[index].cases
    }

    func getStateDeats(index: Int) -> Int {
        print("Getting state deaths")
        return statesData[index].deaths
    }

    func getStateSuspects(index: Int) -> Int {
        print("Getting state suspects")
        return statesData[index].suspects
    }

    func getStatesArraySize() -> Int {
        print("Getting state size")
        guard !countriesData.isEmpty else { return 0 }
        if countriesData[selectedCountry].name == "Brazil" {
            return statesData.count
        }
        return 0
    }

    func getCountryName(index: Int) -> String {
        print("Getting country name")
        return countriesData[index].name
    }

    func getCountryCode(index: Int) -> String {
        print("Getting country code")
        return countriesData[index].code
    }

    func getCountryApiKey(index: Int) -> String {
        print("Getting country api key")
        return countriesData[index].apiKey
    }

    func getCountryArraySize() -> Int {
        print("Getting country array size")
        return countriesData.count
    }

    func setSelectedCountry(index: Int) {
        selectedCountry = index
        loadCountryData()
    }

    func getSelectedCountryName() -> String {
        return countryData.country ?? "N/A"
    }

    func getSelectedCountryCases() -> String {
        guard let cases = countryData.cases else { return "N/A" }
        return String(cases)
    }

    func getSelectedCountryConfirmed() -> String {
        guard let confirmed = countryData.confirmed else { return "N/A" }
        return String(confirmed)
    }

    func getSelectedCountryDeaths() -> String {
        guard let deaths = countryData.deaths else { return "N/A" }
        return String(deaths)
    }

    func getSelectedCountryRecovered() -> String {
        guard let recovered = countryData.recovered else { return "N/A" }
        return String(recovered)
    }
}
