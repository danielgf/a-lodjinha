//
//  Color.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/12/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        let hexDecimalString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexDecimalString)
        
        if hexDecimalString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
        
    }
    
}
