//
//  AboutInteractor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

// MARK: - AboutInteractor Class
final class AboutInteractor: Interactor {
}

// MARK: - AboutInteractor API
extension AboutInteractor: AboutInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension AboutInteractor {
    var presenter: AboutPresenterApi {
        return _presenter as! AboutPresenterApi
    }
}
