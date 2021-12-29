//
//  CountryData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation

public struct StatesData: Codable, Equatable {
    public let uid: Int
    public let uf: String
    public let state: String
    public let cases: Int
    public let deaths: Int
    public let suspects: Int
    public let refuses: Int
    public let broadCast: Bool
    public let comments: String
    public let dateTime: String

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

