//
//  UITableViewCell+UICollectionViewCell+RegisterCell.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

func cellReuseId(_ c: AnyClass) -> String {
    return String(describing: c)
}

extension UITableViewCell {
    static func cellReuseId() -> String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static func cellReuseId() -> String {
        return String(describing: self)
    }
}

extension UIView {
    
    func registerCellClass(_ c: AnyClass) {
        if self is UICollectionView {
            (self as! UICollectionView).register(c, forCellWithReuseIdentifier: cellReuseId(c))
            
        } else if self is UITableView {
            (self as! UITableView).register(c, forCellReuseIdentifier: cellReuseId(c))
        }
    }
    
    func registerNibCell(_ c: AnyClass) {
        let nib = UINib(nibName: cellReuseId(c), bundle: nil)
        if self is UICollectionView {
            (self as! UICollectionView).register(nib, forCellWithReuseIdentifier: cellReuseId(c))
            
        } else if self is UITableView {
            (self as! UITableView).register(nib, forCellReuseIdentifier: cellReuseId(c))
        }
    }
}
