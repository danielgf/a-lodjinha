//
//  HomeRemoteDataManager.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

typealias HomeCompletion = ([Payload]) -> Void

class HomeRemoteDataManager {
    
    class func getApiInformation(endPoint: String, _ productId: String? = nil, completion: @escaping HomeCompletion) {
        
        var url: URL?
        
        if let id = productId {
            let newFinalURL = ServiceConstants.UrlParts.singleProduct.rawValue.replacingOccurrences(of: ServiceConstants.UrlParam.Key.productId, with: id)
            url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + newFinalURL)
        } else {
            url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + endPoint)
        }
        
        guard let newURL = url else { return }
        
        NetworkManager.request(url: newURL, method: .get, handleObject: { (json) in
            var object = [Payload]()
            let payload = GenericResponse(json: json).payload ?? []
            payload.forEach({ object.append($0) })
            completion(object)
        }) { (error) in
            completion([])
        }
        
    }
    
}
