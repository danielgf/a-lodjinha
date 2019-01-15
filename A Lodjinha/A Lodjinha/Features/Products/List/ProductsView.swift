//
//  ProductsView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

//MARK: ProductsView Class
final class ProductsView: TableUserInterface {
    
    // MARK: - Variables
    var productsViewModel = GenericListViewModel()
    
    // MARK: - Outlets
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(ProductsCell.self)
        LoadingView.shared.showActivityIndicatory(view: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Intenal Functions
    
    // MARK: - Actions
}

//MARK: - ProductsView API
extension ProductsView: ProductsViewApi {
    func updateProducts(productsViewModel: GenericListViewModel) {
        LoadingView.shared.hideActivityIndicatory(view: view)
        self.productsViewModel = productsViewModel
        tableView.reloadData()
    }
    
    func showAlert(message: String) {
        LoadingView.shared.hideActivityIndicatory(view: view)
        let alert = UIAlertController.showSimpleAlert(message: message)
        present(alert, animated: true, completion: nil)
    }
    
    func receivedInformation(viewModel: GenericViewModel) {
        title = viewModel.description
    }
}

// MARK: - UITableView API
extension ProductsView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsViewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.cellReuseId(), for: indexPath) as? ProductsCell {
            cell.viewModel = productsViewModel.itemViewModel(indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vm = productsViewModel.itemViewModel(indexPath: indexPath) {
            presenter.goToDetails(productViewModel: vm)
        }
    }
    
}

// MARK: - ProductsView Viper Components API
private extension ProductsView {
    var presenter: ProductsPresenterApi {
        return _presenter as! ProductsPresenterApi
    }

}
