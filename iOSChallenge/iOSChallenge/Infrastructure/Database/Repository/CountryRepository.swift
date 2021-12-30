//
//  CountryRepository.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import SQLite
import PromiseKit

protocol CountryRepository {

}

public class SQLCountryRepository: SQLDatabaseRepository, CountryRepository {
    let tableCountries = Table("Countries")
    let colId = Expression<Int64>("id")
    let colName = Expression<String>("name")
    let colCode = Expression<String>("code")
    let colApiKey = Expression<String>("apiKey")

    public override init(connection: Connection) {
        super.init(connection: connection)
    }

    func createTable() {
        do {
            try db.run(tableCountries.create(ifNotExists: true) { t in
                t.column(colId, primaryKey: true)
                t.column(colName)
                t.column(colCode, unique: true)
                t.column(colApiKey)
            })
        } catch {
            print(error.localizedDescription)
            fatalError()
        }

        insertToTable()

    }

    func insertToTable() {
        do {
            try db.run(tableCountries.delete())
            try db.run(tableCountries.insert(or: .replace, colName <- "Brazil", colCode <- "BR", colApiKey <- "brazil"))
            try db.run(tableCountries.insert(or: .replace, colName <- "United States", colCode <- "US", colApiKey <- "us"))
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchCountryData() -> Promise<[Country]> {
        var countries = [Country]()
        do {
            for country in try db.prepare(tableCountries) {
                let country = Country(id: Int(country[colId]), name: country[colName], code: country[colCode], apiKey: country[colApiKey])
                countries.append(country)
            }
        } catch {
            print(error.localizedDescription)
        }
        return Promise.value(countries)
    }

}
