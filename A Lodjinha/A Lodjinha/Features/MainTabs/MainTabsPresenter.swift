//
//  MainTabsPresenter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - MainTabsPresenter Class
final class MainTabsPresenter: Presenter {
}

// MARK: - MainTabsPresenter API
extension MainTabsPresenter: MainTabsPresenterApi {
}

// MARK: - MainTabs Viper Components
private extension MainTabsPresenter {
    var view: MainTabsViewApi {
        return _view as! MainTabsViewApi
    }
    var interactor: MainTabsInteractorApi {
        return _interactor as! MainTabsInteractorApi
    }
    var router: MainTabsRouterApi {
        return _router as! MainTabsRouterApi
    }
}
