//
//  BannersListViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class GenericListViewModel {

    // MARK: - Properties

    fileprivate var itemsViewModels = [IndexPath: GenericViewModel]()

    var numberOfItems: Int { return itemsViewModels.count }
    
    // MARK: - Initialization
    
    convenience init(_ objects: [Payload]) {
        self.init()
        self.itemsViewModels = objects.enumerated().reduce(into: [IndexPath: GenericViewModel]()) {
            let newIndexPath = IndexPath(row: $1.offset, section: 0)
            $0[newIndexPath] = GenericViewModel($1.element)
        }
    }

    // MARK: - View Model
    
    func itemViewModel(indexPath: IndexPath) -> GenericViewModel? {
        if itemsViewModels.keys.contains(indexPath) {
            return itemsViewModels[indexPath]
        }
        return nil
    }

}
