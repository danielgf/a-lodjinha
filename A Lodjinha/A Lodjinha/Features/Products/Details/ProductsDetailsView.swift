//
//  ProductsDetailsView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

//MARK: ProductsDetailsView Class
final class ProductsDetailsView: UserInterface {
    
    // MARK: - Variables
    var viewModel = GenericViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Intenal Functions
    fileprivate func updateUI() {
        productNameLabel.text = viewModel.name
        newPriceLabel.text = String(format: "Por %.2f", viewModel.newPrice)
        categoryLabel.text = viewModel.categoryViewModel.description
        descriptionLabel.text = viewModel.description
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: String(format: "De: %.2f", viewModel.newPrice))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        oldPriceLabel.attributedText = attributeString
        
        guard let url = URL(string: viewModel.urlImage) else {return}
        productImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "Placeholder"), options: .refreshCached, context: nil)
    }
    
    // MARK: - Actions
    @IBAction func reserve(_ sender: UIButton) {
        presenter.reserve(viewModel: viewModel)
    }
}

//MARK: - ProductsDetailsView API
extension ProductsDetailsView: ProductsDetailsViewApi {
    func receivedInfor(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - ProductsDetailsView Viper Components API
private extension ProductsDetailsView {
    var presenter: ProductsDetailsPresenterApi {
        return _presenter as! ProductsDetailsPresenterApi
    }

}
