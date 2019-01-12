//
//  AppDelegate+Apparence.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setApparence() {
        let navigationBarApparence = UINavigationBar.appearance()
        navigationBarApparence.barTintColor = UIColor(hexString: HexColor.primary.rawValue)
        navigationBarApparence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        let tabBarApparence = UITabBar.appearance()
        tabBarApparence.tintColor = UIColor(hexString: HexColor.primary.rawValue)
    }
}
