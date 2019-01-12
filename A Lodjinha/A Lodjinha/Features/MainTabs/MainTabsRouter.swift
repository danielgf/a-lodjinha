//
//  MainTabsRouter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - MainTabsRouter class
final class MainTabsRouter: Router {
}

// MARK: - MainTabsRouter API
extension MainTabsRouter: MainTabsRouterApi {
}

// MARK: - MainTabs Viper Components
private extension MainTabsRouter {
    var presenter: MainTabsPresenterApi {
        return _presenter as! MainTabsPresenterApi
    }
}
