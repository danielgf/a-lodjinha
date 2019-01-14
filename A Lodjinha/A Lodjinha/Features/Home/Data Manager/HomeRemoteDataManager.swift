//
//  HomeRemoteDataManager.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

typealias HomeCompletion = ([Payload]) -> Void
typealias HomeCategoryCompletion = ([Category]) -> Void

class HomeRemoteDataManager {
    
    class func getBanner(completion: @escaping HomeCompletion) {
        
        guard let url = URL(string: ServiceConstants.UrlParts.baseURL.rawValue + ServiceConstants.UrlParts.banner.rawValue) else {return}
        
        NetworkManager.request(url: url, method: .get, handleObject: { (json) in
            var object = [Payload]()
            let payload = GenericResponse(json: json).payload ?? []
            payload.forEach({ object.append($0) })
            completion(object)
        }) { (error) in
            completion([])
        }
        
    }
    
    class func getCategory(completion: @escaping HomeCategoryCompletion) {
        
    }
    
    class func getProducts(completion: @escaping HomeCompletion) {
        
    }
    
    class func getBestSellers(completion: @escaping HomeCompletion) {
        
    }
    
    class func getSingleProduct(productID: String, completion: @escaping HomeCompletion) {
        
    }
    
}
