//
//  HomeInteractor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - HomeInteractor Class
final class HomeInteractor: Interactor {
}

// MARK: - HomeInteractor API
extension HomeInteractor: HomeInteractorApi {
    func requestBanner() {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.banner.rawValue) { (banners) in
            banners.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingBaner(bannerViewModel: GenericListViewModel(banners))
        }
    }
    
    func requestCategory() {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.categoty.rawValue) { (categogies) in
            categogies.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingCategory(categoryViewModel: GenericListViewModel(categogies))
        }
    }
    
    func requestProducts() {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.products.rawValue) { (products) in
            products.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingProducts(productsViewModel: GenericListViewModel(products))
        }
    }
    
    func requestBestSellers() {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.bestSellers.rawValue) { (bestSellers) in
            bestSellers.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingBestSellers(bestSellersViewModel: GenericListViewModel(bestSellers))
        }
    }
    
    func requestProduct(productId: String) {
        RemoteDataManager.getApiInformation(endPoint: ServiceConstants.UrlParts.singleProduct.rawValue, productId) { (product) in
            productId.count == 0 ? self.presenter.didFailLoading() : self.presenter.didFinishLoadingProduct(productViewModel: GenericListViewModel(product))
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension HomeInteractor {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }
}
