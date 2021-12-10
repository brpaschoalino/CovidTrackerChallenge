//
//  CountryData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation

struct Data: Codable {
    var data: [StatesData]

    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct StatesData: Codable {
    var uid: Int
    var uf: String
    var state: String
    var cases: Int
    var deaths: Int
    var suspects: Int

    enum CodingKeys: String, CodingKey{
        case uid
        case uf
        case state
        case cases
        case deaths
        case suspects
    }
}
