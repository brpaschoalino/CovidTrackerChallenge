//
//  CountryData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation

struct StatesData: Codable, Equatable {
    var uid: Int
    var uf: String
    var state: String
    var cases: Int
    var deaths: Int
    var suspects: Int
    var refuses: Int
    var broadCast: Bool
    var comments: String
    var dateTime: String

    enum CodingKeys: String, CodingKey{
        case uid
        case uf
        case state
        case cases
        case deaths
        case suspects
        case refuses
        case broadCast = "broadcast"
        case comments
        case dateTime = "datetime"
    }
}

