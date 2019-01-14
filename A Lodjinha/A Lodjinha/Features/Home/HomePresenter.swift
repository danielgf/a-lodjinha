//
//  HomePresenter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - HomePresenter Class
final class HomePresenter: Presenter {
}

// MARK: - HomePresenter API
extension HomePresenter: HomePresenterApi {
    func getBanner() {
        interactor.requestBanner()
    }
    
    func didFinishLoadingBaner(bannerViewModel: GenericListViewModel) {
        view.updateBanners(bannerViewModel: bannerViewModel)
    }
    
    func didFailLoading() {
        view.showAlert(message: "error")
    }
    
    func getCategory() {
        interactor.requestCategory()
    }
    
    func didFinishLoadingCategory(categoryViewModel: CategoryListViewModel) {
        view.updateCategory(categoryViewModel: categoryViewModel)
    }
    
    func getProducts() {
        interactor.requestProducts()
    }
    
    func didFinishLoadingProducts(productsViewModel: GenericListViewModel) {
        view.updateProducts(productsViewModel: productsViewModel)
    }
    
    func getBestSellers() {
        interactor.requestBestSellers()
    }
    
    func didFinishLoadingBestSellers(bestSellersViewModel: GenericListViewModel) {
        view.updatebestSellers(bestSellersViewModel: bestSellersViewModel)
    }
    
    func getProduct(productId: String) {
        interactor.requestProduct(productId: productId)
    }
    
    func didFinishLoadingProduct(productViewModel: GenericListViewModel) {
    }
    
}

// MARK: - Home Viper Components
private extension HomePresenter {
    var view: HomeViewApi {
        return _view as! HomeViewApi
    }
    var interactor: HomeInteractorApi {
        return _interactor as! HomeInteractorApi
    }
    var router: HomeRouterApi {
        return _router as! HomeRouterApi
    }
}
