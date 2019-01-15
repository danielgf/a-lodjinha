//
//  ProductsRouter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsRouter class
final class ProductsRouter: Router {
}

// MARK: - ProductsRouter API
extension ProductsRouter: ProductsRouterApi {
    func presentDetails(productViewModel: GenericViewModel) {
        AppModules.productsDetails.build(sbModule: .products).router.push(from: self, setupData: productViewModel)
    }
    
}

// MARK: - Products Viper Components
private extension ProductsRouter {
    var presenter: ProductsPresenterApi {
        return _presenter as! ProductsPresenterApi
    }
}
