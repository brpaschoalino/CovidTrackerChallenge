//
//  StatesDataMock.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 22/12/21.
//

import XCTest
@testable import XcodeGenSample

struct StatesDataMocked: Codable, Equatable {
    static func with(uId: Int = 11,
                     uf: String = "Rondônia",
                     state: String = "RO",
                     cases: Int = 0,
                     deaths: Int = 0,
                     suspects: Int = 61,
                     refuses: Int = 2,
                     broadCast: Bool = false, 
                     comments: String = "",
                     dateTime: String = "2020-03-18T23:00:00.000Z") -> StatesData {
        return StatesData(uid: uId,
                          uf: uf,
                          state: state,
                          cases: cases,
                          deaths: deaths,
                          suspects: suspects,
                          refuses: refuses,
                          broadCast: broadCast,
                          comments: comments,
                          dateTime: dateTime)
    }
}
