//
//  StatesDataRequest.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 19/12/21.
//

import Foundation
import PromiseKit

class FetchStatesDataUseCase {

    private var service = GetApiData()

    func execute() {

    }

    func doStatesDataRequest( success: @escaping () -> Void ){
        guard let statesDataUrl = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1/brazil/20200318") else { return }
        let urlRequest = URLRequest(url: statesDataUrl)

        service.apiStatesData(url: urlRequest, success: { (data) in
            print("Filling the data list")
            success()
        })
    }
}
