//
//  ProductsDetailsRouter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsDetailsRouter class
final class ProductsDetailsRouter: Router {
}

// MARK: - ProductsDetailsRouter API
extension ProductsDetailsRouter: ProductsDetailsRouterApi {
}

// MARK: - ProductsDetails Viper Components
private extension ProductsDetailsRouter {
    var presenter: ProductsDetailsPresenterApi {
        return _presenter as! ProductsDetailsPresenterApi
    }
}
