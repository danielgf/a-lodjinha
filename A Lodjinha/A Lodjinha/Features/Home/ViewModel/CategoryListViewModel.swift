//
//  CategoryListViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class CategoryListViewModel {

    // MARK: - Properties

    fileprivate var itemsViewModels = [IndexPath: CategoryViewModel]()

    var numberOfItems: Int { return itemsViewModels.count }
    
    // MARK: - Initialization
    
    convenience init(_ objects: [Categoria]) {
        self.init()
        self.itemsViewModels = objects.enumerated().reduce(into: [IndexPath: CategoryViewModel]()) {
            let newIndexPath = IndexPath(row: $1.offset, section: 0)
            $0[newIndexPath] = CategoryViewModel($1.element)
        }
    }

    // MARK: - View Model
    
    func itemViewModel(indexPath: IndexPath) -> CategoryViewModel? {
        if itemsViewModels.keys.contains(indexPath) {
            return itemsViewModels[indexPath]
        }
        return nil
    }

}
