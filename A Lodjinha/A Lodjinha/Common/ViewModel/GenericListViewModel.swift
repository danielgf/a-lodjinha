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
        buildList(objects)
    }
    
    // MARK: - Others
    fileprivate func buildList(_ items: [Payload]) {
        let itemsCount = itemsViewModels.count
        for (i, item) in items.enumerated() {
            let indexPath = IndexPath(row: i+itemsCount, section: 0)
            itemsViewModels[indexPath] = GenericViewModel(item)
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
