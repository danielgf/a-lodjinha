//
//  AboutView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

//MARK: AboutView Class
final class AboutView: UserInterface {
    
    // MARK: - Variables
    
    // MARK: - Outlets
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Intenal Functions
    
    // MARK: - Actions
}

//MARK: - AboutView API
extension AboutView: AboutViewApi {
}

// MARK: - AboutView Viper Components API
private extension AboutView {
    var presenter: AboutPresenterApi {
        return _presenter as! AboutPresenterApi
    }

}
