//
//  ProductsPresenter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsPresenter Class
final class ProductsPresenter: Presenter {
    
    override func setupView(data: Any) {
        if let vm = data as? GenericViewModel {
            requestProductsByCategory(id: vm.id)
            view.receivedInformation(viewModel: vm)
        }
    }
}

// MARK: - ProductsPresenter API
extension ProductsPresenter: ProductsPresenterApi {
    
    func requestProductsByCategory(id: Int) {
        interactor.requestProductsByCategory(id: id)
    }
    
    func didFailLoading() {
        view.showAlert(message: "error")
    }
    
    func didFinishLoadingProducts(productsViewModel: GenericListViewModel) {
        view.updateProducts(productsViewModel: productsViewModel)
    }
    
    func goToDetails(productViewModel: GenericViewModel) {
        router.presentDetails(productViewModel: productViewModel)
    }
    
}

// MARK: - Products Viper Components
private extension ProductsPresenter {
    var view: ProductsViewApi {
        return _view as! ProductsViewApi
    }
    var interactor: ProductsInteractorApi {
        return _interactor as! ProductsInteractorApi
    }
    var router: ProductsRouterApi {
        return _router as! ProductsRouterApi
    }
}
