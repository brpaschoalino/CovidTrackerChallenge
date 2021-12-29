//
//  GetApiData.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation
import Alamofire
import PromiseKit

enum HTTPMethod: String {
    case get = "GET"
}

public enum NetworkError: Error {
    case badRequest
    case badResponse
}

public enum InfrastructureError: Error {
    case badConvertion
}

protocol Request {
    var url: String { get }
    var method: HTTPMethod { get }
    var responseType: Response.Type { get }
}

extension Request {
    func urlRequest() -> URLRequest? {
        guard let dataUrl = URL(string: self.url) else { return nil }
        let urlRequest = URLRequest(url: dataUrl)
        return urlRequest
    }
}

protocol Response {
    init(data: Data?) throws
}

class HTTPNetworkClient {

    static public var shared = HTTPNetworkClient()

    func execute(request: Request) -> Promise<Response> {
        guard let urlRequest = request.urlRequest() else { return Promise.init(error: NetworkError.badRequest)}
        return Promise { seal in
            AF.request(urlRequest).validate().responseJSON { response in
                if let data = try? request.responseType.init(data: response.data) {
                    seal.fulfill(data)
                } else {
                    seal.reject(NetworkError.badResponse)
                }

            }
        }
    }
}
