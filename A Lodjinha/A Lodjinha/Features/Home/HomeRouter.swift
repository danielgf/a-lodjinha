//
//  HomeRouter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - HomeRouter class
final class HomeRouter: Router {
}

// MARK: - HomeRouter API
extension HomeRouter: HomeRouterApi {
    func presentDetails(productViewModel: GenericViewModel) {
        AppModules.productsDetails.build(sbModule: .products).router.push(from: self, setupData: productViewModel)
    }
    
    func presentProductsList(categogyViewModel: GenericViewModel) {
        AppModules.products.build().router.push(from: self, setupData: categogyViewModel)
    }
}

// MARK: - Home Viper Components
private extension HomeRouter {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }
}
