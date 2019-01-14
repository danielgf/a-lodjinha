//
//  CategoryViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class CategoryViewModel {

    // MARK: - Initialization

    convenience init(_ object: Categoria?) {
        self.init()
        self.object = object
    }

    // MARK: - Properties

   var object: Categoria?
    
    var id: Int { return object?.id ?? 0 }
    var urlImage: String { return object?.urlImagem ?? "" }
    var description: String { return object?.descricao ?? "" }
    

}
