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
    func updateBanners(bannerViewModel: BannersListViewModel)
}

//MARK: - HomePresenter API
protocol HomePresenterApi: PresenterProtocol {
    func getBanner()
    func didFinishLoadingBaner(bannerViewModel: BannersListViewModel)
    func didFailLoadingBanner()
}

//MARK: - HomeInteractor API
protocol HomeInteractorApi: InteractorProtocol {
    func requestBanner()
}
