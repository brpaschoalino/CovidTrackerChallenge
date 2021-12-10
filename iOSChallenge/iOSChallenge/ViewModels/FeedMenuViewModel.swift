//
//  FeedMenuViewModel.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation

class FeedMenuViewModel {
    static let shared: FeedMenuViewModel = FeedMenuViewModel()

    private var countryData = [StatesData]()

    func fillStatesData(statesData: [StatesData] ) {
        self.countryData.append(contentsOf: statesData)

        print("success in fetching states data")
    }

    func getStateUF(index: Int) -> String {
        print("Getting state uf")
        return countryData[index].uf
    }

    func getState(index: Int) -> String {
        print("Getting state name")
        return countryData[index].state
    }

    func getStateCases(index: Int) -> Int {
        print("Getting state cases")
        return countryData[index].cases
    }

    func getStateDeats(index: Int) -> Int {
        print("Getting state deaths")
        return countryData[index].deaths
    }

    func getStateSuspects(index: Int) -> Int {
        print("Getting state suspects")
        return countryData[index].suspects
    }
}
