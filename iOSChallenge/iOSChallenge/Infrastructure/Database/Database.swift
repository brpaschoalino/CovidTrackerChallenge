//
//  Database.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import SQLite

public class Database {

    public let connection: Connection

    public init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        do {
            connection = try Connection("\(path)/db.sqlite3")
            print(path)
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
    }
}
