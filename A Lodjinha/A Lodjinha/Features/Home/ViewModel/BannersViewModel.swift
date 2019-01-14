//
//  BannersViewModel.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class BannersViewModel {

    // MARK: - Initialization

    convenience init(_ object: Payload?) {
        self.init()
        self.object = object
    }

    // MARK: - Properties

    var object: Payload?
    
    var id: Int { return object?.id ?? 0 }
    var linkUrl: String { return object?.linkUrl ?? "" }
    var urlImage: String { return object?.urlImagem ?? "" }
    

}
