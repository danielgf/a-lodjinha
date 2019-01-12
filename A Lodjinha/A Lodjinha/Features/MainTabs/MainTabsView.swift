//
//  MainTabsView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

//MARK: MainTabsView Class
final class MainTabsView: TabUserInterface {
    
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

//MARK: - MainTabsView API
extension MainTabsView: MainTabsViewApi {
}

// MARK: - MainTabsView Viper Components API
private extension MainTabsView {
    var presenter: MainTabsPresenterApi {
        return _presenter as! MainTabsPresenterApi
    }

}
