//
//  HomeRemoteDataManager.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

typealias RemoteCompletion = ([Payload]) -> Void

class RemoteDataManager {
    
    class func getApiInformation(endPoint: String, _ productId: String? = nil, _ categoryId: Int? = nil, completion: @escaping RemoteCompletion) {
        
        var url: URL?
        
        if let id = productId {
            let newFinalURL = ServiceConstants.UrlParts.singleProduct.rawValue.replacingOccurrences(of: ServiceConstants.UrlParam.Key.productId, with: id)
            url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + newFinalURL)
        } else if let id = categoryId {
            let newFinalURL = ServiceConstants.UrlParts.productByCategory.rawValue.replacingOccurrences(of: ServiceConstants.UrlParam.Key.categoryId, with: String(id))
            url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + newFinalURL)
        } else {
            url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + endPoint)
        }
        
        guard let newURL = url else { return }
        
        NetworkManager.request(url: newURL, method: .get, handleObject: { (json) in
            var object = [Payload]()
            object.removeAll()
            let payload = GenericResponse(json: json).payload ?? []
            payload.forEach({ object.append($0) })
            completion(object)
        }) { (error) in
            completion([])
        }
        
    }
    
}
