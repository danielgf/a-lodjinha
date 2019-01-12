//
//  ServiceConstants.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/12/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

struct ServiceConstants {
    
    enum UrlParts: String {
        case baseURL = "https://alodjinha.herokuapp.com"
        
        case banner = "/banner"
        case categoty = "/categoria"
        case products = "/produto"
        case bestSellers = "/produto/maisvendidos"
        case singleProduct = "/produto/{produtoId}"
    }
    
    struct UrlParam {
        
        struct Key {
            static let productId = "produtoId"
        }
        
    }
    
}
