//
//  ProductsModuleApi.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

//MARK: - ProductsRouter API
protocol ProductsRouterApi: RouterProtocol {
    func presentDetails(productViewModel: GenericViewModel)
}

//MARK: - ProductsView API
protocol ProductsViewApi: UserInterfaceProtocol {
    func updateProducts(productsViewModel: GenericListViewModel)
    func showAlert(message: String)
    func receivedInformation(viewModel: GenericViewModel)
}

//MARK: - ProductsPresenter API
protocol ProductsPresenterApi: PresenterProtocol {
    func didFinishLoadingProducts(productsViewModel: GenericListViewModel)
    func didFailLoading()
    func goToDetails(productViewModel: GenericViewModel)
}

//MARK: - ProductsInteractor API
protocol ProductsInteractorApi: InteractorProtocol {
    func requestProductsByCategory(id: Int)
}
