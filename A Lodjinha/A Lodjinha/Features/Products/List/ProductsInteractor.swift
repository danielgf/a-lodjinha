//
//  ProductsInteractor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsInteractor Class
final class ProductsInteractor: Interactor {
}

// MARK: - ProductsInteractor API
extension ProductsInteractor: ProductsInteractorApi {
    func requestProductsByCategory(id: Int) {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.productByCategory.rawValue, nil, id) { (products) in
            products.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingProducts(productsViewModel: GenericListViewModel(products))
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension ProductsInteractor {
    var presenter: ProductsPresenterApi {
        return _presenter as! ProductsPresenterApi
    }
}
