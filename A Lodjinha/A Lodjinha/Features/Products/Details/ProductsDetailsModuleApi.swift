//
//  ProductsDetailsModuleApi.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

//MARK: - ProductsDetailsRouter API
protocol ProductsDetailsRouterApi: RouterProtocol {
}

//MARK: - ProductsDetailsView API
protocol ProductsDetailsViewApi: UserInterfaceProtocol {
    func receivedInfor(viewModel: GenericViewModel)
    func showAlert(message: String)
}

//MARK: - ProductsDetailsPresenter API
protocol ProductsDetailsPresenterApi: PresenterProtocol {
    func reserve(viewModel: GenericViewModel)
    func didSuccessReserved()
    func didFailReserved()
}

//MARK: - ProductsDetailsInteractor API
protocol ProductsDetailsInteractorApi: InteractorProtocol {
    func reserveProduct(id: Int)
}
