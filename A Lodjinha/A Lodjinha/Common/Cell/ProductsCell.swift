//
//  BestSellersCell.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsCell: UITableViewCell {
    
    // MARK: - Variables
    var viewModel: GenericViewModel! { didSet { updateUI() } }
    
    
    // MARK: - Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    
    // MARK: - Life Cicle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Update Cell Informations
    fileprivate func updateUI() {
        productImage.sd_setImage(with: URL(string: viewModel.urlImage), placeholderImage: #imageLiteral(resourceName: "Placeholder"), options: .refreshCached, context: nil)
        productNameLabel.text = viewModel.name
        newPriceLabel.text = String(format: "Por %.2f", viewModel.newPrice)
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: String(format: "De: %.2f", viewModel.newPrice))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        oldPriceLabel.attributedText = attributeString
    }
    
}
