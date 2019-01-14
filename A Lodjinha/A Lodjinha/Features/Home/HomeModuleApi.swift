//
//  HomeModuleApi.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

//MARK: - HomeRouter API
protocol HomeRouterApi: RouterProtocol {
}

//MARK: - HomeView API
protocol HomeViewApi: UserInterfaceProtocol {
    func showAlert(message: String)
    func updateBanners(bannerViewModel: GenericListViewModel)
    func updateCategory(categoryViewModel: CategoryListViewModel)
    func updateProducts(productsViewModel: GenericListViewModel)
    func updatebestSellers(bestSellersViewModel: GenericListViewModel)
}

//MARK: - HomePresenter API
protocol HomePresenterApi: PresenterProtocol {
    func getBanner()
    func didFinishLoadingBaner(bannerViewModel: GenericListViewModel)
    func didFailLoading()
    
    func getCategory()
    func didFinishLoadingCategory(categoryViewModel: CategoryListViewModel)
    
    func getProducts()
    func didFinishLoadingProducts(productsViewModel: GenericListViewModel)
    
    func getBestSellers()
    func didFinishLoadingBestSellers(bestSellersViewModel: GenericListViewModel)
    
    func getProduct(productId: String)
    func didFinishLoadingProduct(productViewModel: GenericListViewModel)
}

//MARK: - HomeInteractor API
protocol HomeInteractorApi: InteractorProtocol {
    func requestBanner()
    func requestCategory()
    func requestProducts()
    func requestBestSellers()
    func requestProduct(productId: String)
}
