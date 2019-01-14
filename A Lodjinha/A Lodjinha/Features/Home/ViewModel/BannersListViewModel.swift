//
//  BannersListViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class BannersListViewModel {

    // MARK: - Properties

    fileprivate var itemsViewModels = [IndexPath: BannersViewModel]()

    var numberOfItems: Int { return itemsViewModels.count }
    
    // MARK: - Initialization
    
    convenience init(_ objects: [Payload]) {
        self.init()
        self.itemsViewModels = objects.enumerated().reduce(into: [IndexPath: BannersViewModel]()) {
            let newIndexPath = IndexPath(row: $1.offset, section: 0)
            $0[newIndexPath] = BannersViewModel($1.element)
        }
    }

    // MARK: - View Model
    
    func itemViewModel(indexPath: IndexPath) -> BannersViewModel? {
        if itemsViewModels.keys.contains(indexPath) {
            return itemsViewModels[indexPath]
        }
        return nil
    }

}
