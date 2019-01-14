//
//  BannersViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class GenericViewModel {

    // MARK: - Initialization

    convenience init(_ object: Payload?) {
        self.init()
        self.object = object
    }

    // MARK: - Properties

    var object: Payload?
    
    var urlImage: String { return object?.urlImagem ?? "" }
    var id: Int { return object?.id ?? 0 }
    var description: String { return object?.descricao ?? "" }
    var oldPrice: Double { return object?.precoDe ?? 0.0 }
    var name: String { return object?.nome ?? "" }
    var newPrice: Double { return object?.precoPor ?? 0.0 }
    var linkUrl: String { return object?.linkUrl ?? "" }
    
    var categoryViewModel: CategoryViewModel {
        if let category = object?.categoria {
            return CategoryViewModel(category)
        }
        return CategoryViewModel()
    }
    
    var categoryID: Int { return categoryViewModel.id }
    
    var categoryUrlImage: String { return categoryViewModel.urlImage }
    
    var categoryDescription: String { return categoryViewModel.description }
    
    
    
}
