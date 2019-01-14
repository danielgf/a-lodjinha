//
//  NetworkManager.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let shated = NetworkManager()
    
    static func request(url: URL, method: HTTPMethod, _ parameters: [String: Any]? = nil, _ encoding: ParameterEncoding = JSONEncoding.default, _ headers: HTTPHeaders? = nil, handleObject: @escaping (JSON) -> Void, handleError: @escaping (Error) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                if let result = response.result.value {
                    let json = JSON(result)
                    handleObject(json)
                }
            }else {
                if let error = response.result.error {
                    handleError(error)
                }
            }
        }
    }
}
