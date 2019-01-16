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
    var products = [Payload]()
}

// MARK: - ProductsInteractor API
extension ProductsInteractor: ProductsInteractorApi {
    func requestProductsByCategory(id: Int, offSet: Int) {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.productByCategory.rawValue, nil, id, offSet) { (products, status)  in
            
            if status, products.count != 0 {
                self.products.append(contentsOf: products)
                self.presenter.didFinishLoadingProducts(productsViewModel: GenericListViewModel(self.products))
            }else if products.count == 0 {
                self.presenter.didGetAllProducts()
            }else {
                self.presenter.didFailLoading()
            }
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension ProductsInteractor {
    var presenter: ProductsPresenterApi {
        return _presenter as! ProductsPresenterApi
    }
}
