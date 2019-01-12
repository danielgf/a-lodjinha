//
//  HomeView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

//MARK: HomeView Class
final class HomeView: UserInterface {
    
    // MARK: - Variables
        
    // MARK: - Outlets
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "LogoNavBar"))
    }
    
    // MARK: - Intenal Functions
    
    // MARK: - Actions
}

//MARK: - HomeView API
extension HomeView: HomeViewApi {
}

// MARK: - HomeView Viper Components API
private extension HomeView {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }

}
