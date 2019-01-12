//
//  AboutRouter.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - AboutRouter class
final class AboutRouter: Router {
}

// MARK: - AboutRouter API
extension AboutRouter: AboutRouterApi {
}

// MARK: - About Viper Components
private extension AboutRouter {
    var presenter: AboutPresenterApi {
        return _presenter as! AboutPresenterApi
    }
}
