//
//  AboutPresenter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - AboutPresenter Class
final class AboutPresenter: Presenter {
}

// MARK: - AboutPresenter API
extension AboutPresenter: AboutPresenterApi {
}

// MARK: - About Viper Components
private extension AboutPresenter {
    var view: AboutViewApi {
        return _view as! AboutViewApi
    }
    var interactor: AboutInteractorApi {
        return _interactor as! AboutInteractorApi
    }
    var router: AboutRouterApi {
        return _router as! AboutRouterApi
    }
}
