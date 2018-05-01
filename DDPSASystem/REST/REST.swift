//
//  REST.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol CoreAPIProtocol {
    
    func request(apiURL: String, method: String, params: CoreAPI.ParamsAPI?,
                 successHandler: @escaping CoreAPI.SuccessHandler,
                 errorHandler: @escaping CoreAPI.ErrorHandler)
}

extension CoreAPI: CoreAPIProtocol {
    
    func request(apiURL: String, method: String, params: ParamsAPI?, successHandler: @escaping SuccessHandler, errorHandler: @escaping ErrorHandler) {
        let url = String(format: "%@/", apiURL)
        if let request = makeRequest(url: url, params: params, method: method) {
            dataResult(request: request, successHandler: successHandler, errorHandler: errorHandler)
        }
    }
}

final class CoreAPI {
    
    typealias ParamsAPI = [String: Any]
    typealias ErrorHandler   = (ErrorNetworkServiceType) -> ()
    typealias SuccessHandler = (CoreAPI.ParamsAPI) -> ()
    
    fileprivate func makeRequest(url: String, params: ParamsAPI?, method: String) -> URLRequest? {
        if let URL = URL(string: url) {
            var request = URLRequest(url: URL as URL)
            request.httpMethod = method
            if let p = params {
                request.httpBody = try? JSONSerialization.data(withJSONObject: p)
            }
            return request
        }
        return nil
    }
    
    fileprivate func dataResult(request: URLRequest, successHandler: @escaping SuccessHandler, errorHandler: @escaping ErrorHandler) {
        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error API: Unable to get http response")
                errorHandler(.noResponse)
                return
            }
            
            if httpResponse.statusCode != 200 && httpResponse.statusCode != 204 {
                if let data = data, let _ = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    errorHandler(.wrongRequestStructure)
                    return
                }
            }
            
            guard let data = data, let response = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("Error API: Unable to serialization data")
                errorHandler(.unableToSerialization)
                return
            }
            
            if let result = response { successHandler(result) }
            
            }.resume()
    }
}
