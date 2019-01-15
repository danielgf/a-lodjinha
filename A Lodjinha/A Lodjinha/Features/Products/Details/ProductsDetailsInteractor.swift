//
//  ProductsDetailsInteractor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsDetailsInteractor Class
final class ProductsDetailsInteractor: Interactor {
}

// MARK: - ProductsDetailsInteractor API
extension ProductsDetailsInteractor: ProductsDetailsInteractorApi {
    func reserveProduct(id: Int) {
        RemoteDataManager.postApiInformation(endPoint: ServiceConstants.UrlParts.productByCategory.rawValue, productId: String(id)) { (status) in
            status ? self.presenter.didSuccessReserved() : self.presenter.didFailReserved()
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension ProductsDetailsInteractor {
    var presenter: ProductsDetailsPresenterApi {
        return _presenter as! ProductsDetailsPresenterApi
    }
}
