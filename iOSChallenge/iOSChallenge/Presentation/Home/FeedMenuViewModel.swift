//
//  FeedMenuViewModel.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import UIKit

public extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class FeedMenuViewModel {

    private var countryData = [StatesData]()
    private var fetchStatesDataUseCase: FetchStatesDataUseCase

    init(fetchStatesDataUseCase: FetchStatesDataUseCase = FetchStatesDataUseCase()) {
        self.fetchStatesDataUseCase = fetchStatesDataUseCase
    }

    func doStatesDataRequest() {

    }

    func getStateUF(index: Int) -> String {
        print("Getting state uf")
        return countryData[safe: index]?.uf ?? ""
    }

    func getState(index: Int) -> String {
        print("Getting state name")
        return countryData[safe: index]?.state ?? ""
    }

    func getStateCases(index: Int) -> Int {
        print("Getting state cases")
        return countryData[safe: index]?.cases ?? 0
    }

    func getStateDeats(index: Int) -> Int {
        print("Getting state deaths")
        return countryData[safe: index]?.deaths ?? 0
    }

    func getStateSuspects(index: Int) -> Int {
        print("Getting state suspects")
        return countryData[safe: index]?.suspects ?? 0
    }

    func getCountryDataSize() -> Int {
        return countryData.count
    }
}
