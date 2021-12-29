//
//  SQLDatabaseRepository.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import SQLite

public class SQLDatabaseRepository {
    public let db: Connection

    public init(connection: Connection) {
        self.db = connection
    }
}
