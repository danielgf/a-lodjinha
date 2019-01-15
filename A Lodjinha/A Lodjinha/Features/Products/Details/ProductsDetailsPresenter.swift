//
//  ProductsDetailsPresenter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - ProductsDetailsPresenter Class
final class ProductsDetailsPresenter: Presenter {
    override func setupView(data: Any) {
        if let vm = data as? GenericViewModel {
            view.receivedInfor(viewModel: vm)
        }
    }
}

// MARK: - ProductsDetailsPresenter API
extension ProductsDetailsPresenter: ProductsDetailsPresenterApi {
    func reserve(viewModel: GenericViewModel) {
        interactor.reserveProduct(id: viewModel.id)
    }
    
    func didSuccessReserved() {
        view.showAlert(message: "successReserve".localized())
    }
    
    func didFailReserved() {
        view.showAlert(message: "failToReserve".localized())
    }
}

// MARK: - ProductsDetails Viper Components
private extension ProductsDetailsPresenter {
    var view: ProductsDetailsViewApi {
        return _view as! ProductsDetailsViewApi
    }
    var interactor: ProductsDetailsInteractorApi {
        return _interactor as! ProductsDetailsInteractorApi
    }
    var router: ProductsDetailsRouterApi {
        return _router as! ProductsDetailsRouterApi
    }
}
