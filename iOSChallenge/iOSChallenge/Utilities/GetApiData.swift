//
//  GetApiData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation
import Alamofire

class GetApiData {

    func apiStatesData (url: URLRequest, success: @escaping ([StatesData]) -> Void) {
        AF.request(url).validate().responseJSON { response in
            guard let statesData = try?JSONDecoder().decode(getStateData.self, from: response.data!) else { return }

                success(statesData.data)

                print("success in fetching states data")
        }
    }
}
