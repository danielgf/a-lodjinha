//
//  MainTabsInteractor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - MainTabsInteractor Class
final class MainTabsInteractor: Interactor {
}

// MARK: - MainTabsInteractor API
extension MainTabsInteractor: MainTabsInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension MainTabsInteractor {
    var presenter: MainTabsPresenterApi {
        return _presenter as! MainTabsPresenterApi
    }
}
