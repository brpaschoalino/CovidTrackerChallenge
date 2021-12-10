//
//  GetApiData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation
import Alamofire

class GetApiData {

    func apiStatesData (url: URL, success: @escaping ([StatesData]) -> Void){
        AF.request(url).validate().responseJSON{ response in
            do {
                let statesData = try JSONDecoder().decode(Data.self, from: response.data!)

                success(statesData.data)

                print("success in fetching country data")
            } catch ( let error ) {
                print(error)
            }
        }.cURLDescription { description in
            print(description)

        }
    }
}
