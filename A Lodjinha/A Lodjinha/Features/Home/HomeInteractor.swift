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
        HomeRemoteDataManager.getBanner { (banners) in
            banners.count == 0 ? self.presenter.didFailLoadingBanner() : self.presenter.didFinishLoadingBaner(bannerViewModel: BannersListViewModel(banners))
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension HomeInteractor {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }
}
