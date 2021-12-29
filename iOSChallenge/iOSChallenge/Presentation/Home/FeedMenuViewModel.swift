//
//  FeedMenuViewModel.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import Combine

public extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class FeedMenuViewModel: ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()

    private var statesData = [StatesData]()
    private var countryData = [Country]()

    private var error: Error?

    private let fetchStatesDataUseCase: FetchStatesDataUseCase
    private let fetchCountriesDataUseCase: FetchCountriesUseCase

    init(fetchStatesDataUseCase: FetchStatesDataUseCase = FetchStatesDataUseCase(), fetchCountriesDataUseCase: FetchCountriesUseCase = FetchCountriesUseCase()) {
        self.fetchStatesDataUseCase = fetchStatesDataUseCase
        self.fetchCountriesDataUseCase = fetchCountriesDataUseCase
    }

    func loadStatesData() {
        fetchStatesDataUseCase.execute().done { statesData in
            self.statesData = statesData
        }.catch { error in
            print(error.localizedDescription)
            self.error = error
        }.finally {
            self.objectWillChange.send()
        }
    }

    func loadCountryData() {
        fetchCountriesDataUseCase.execute().done { countryData in
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

    func getCountryDataSize() -> Int {
        print("Getting state size")
        return statesData.count
    }

    func getCountryName(index: Int) -> String {
        print("Getting country name")
        return countryData[index].name
    }

    func getCountryCode(index: Int) -> String {
        print("Getting country code")
        return countryData[index].code
    }
}
