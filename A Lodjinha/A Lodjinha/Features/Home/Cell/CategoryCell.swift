//
//  CategoryCell.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/13/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryCell: UICollectionViewCell {

    // MARK: - Variables
    var viewModel: GenericViewModel? { didSet { updateUI() } }
    
    // MARK: - Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    // MARK: - Life Cicle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Update Cell Informations
    fileprivate func updateUI() {
        guard let url = viewModel?.urlImage else { return }
        productImage.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "Placeholder"), options: .refreshCached, context: nil)
        productNameLabel.text = viewModel?.description
        
    }
}
