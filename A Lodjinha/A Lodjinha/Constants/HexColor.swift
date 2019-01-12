//
//  HexColor.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/12/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

enum HexColor: String {
    case primary = "5d2a84"
    
    func color() -> UIColor {
        return UIColor(hexString: self.rawValue)
    }
}
