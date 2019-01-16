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
    var receivedViewModel = GenericViewModel()
    var offSet = 0
    
    // MARK: - Outlets
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(ProductsCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        LoadingView.shared.showActivityIndicatory(view: view)
        requestProducts()
    }
    
    // MARK: - Intenal Functions
    fileprivate func requestProducts() {
        presenter.requestProductsByCategory(id: receivedViewModel.id, offSet: offSet)
    }
    
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
        receivedViewModel = viewModel
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == productsViewModel.numberOfItems {
            offSet += 20
            requestProducts()
        }
    }
    
}

// MARK: - ProductsView Viper Components API
private extension ProductsView {
    var presenter: ProductsPresenterApi {
        return _presenter as! ProductsPresenterApi
    }

}
