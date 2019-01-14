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
    
    func didFinishLoadingBaner(bannerViewModel: BannersListViewModel) {
        view.updateBanners(bannerViewModel: bannerViewModel)
    }
    
    func didFailLoadingBanner() {
        view.showAlert(message: "error")
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
