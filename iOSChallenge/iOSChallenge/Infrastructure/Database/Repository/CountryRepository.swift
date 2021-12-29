//
//  CountryRepository.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import SQLite

protocol CountryRepository {

}

public class SQLCountryRepository: SQLDatabaseRepository, CountryRepository {
    let tableCountries = Table("Countries")
    let colId = Expression<Int64>("id")
    let colName = Expression<String>("name")
    let colCode = Expression<String>("code")

    public override init(connection: Connection) {
        super.init(connection: connection)
    }

    func createTable() {
        do {
            try db.run(tableCountries.create(ifNotExists: true) { t in
                t.column(colId, primaryKey: true)
                t.column(colName)
                t.column(colCode, unique: true)
            })
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
        
        insertToTable()

    }

    func insertToTable() {
        do {
            try db.run(tableCountries.insert(or: .replace, colName <- "Brazil", colCode <- "br"))
            try db.run(tableCountries.insert(or: .replace, colName <- "United States", colCode <- "us"))
        } catch {
            print(error.localizedDescription)
        }
    }

}
