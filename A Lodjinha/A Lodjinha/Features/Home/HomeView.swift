//
//  HomeView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

//MARK: HomeView Class
final class HomeView: UserInterface {
    
    // MARK: - Variables
    var bannerViewModel = GenericListViewModel()
    var categoryViewModel = GenericListViewModel()
    var bestSellersViewModel = GenericListViewModel()
    var productsViewModel = GenericListViewModel()
        
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNibCell(CategoryCell.self)
        tableView.registerNibCell(ProductsCell.self)
        pageControl.numberOfPages = bannerViewModel.numberOfItems
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "LogoNavBar"))
        initialRequests()
        navigationController?.navigationBar.tintColor = .white
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Intenal Functions
    fileprivate func initialRequests() {
        LoadingView.shared.showActivityIndicatory(view: view)
        presenter.getBanner()
    }
    
    fileprivate func updateScrollView() {
        pageControl.numberOfPages = bannerViewModel.numberOfItems
        for index in 0...bannerViewModel.numberOfItems {
            let url = bannerViewModel.itemViewModel(indexPath: IndexPath(row: index, section: 0))?.urlImage ?? ""
            let imageView = UIImageView()
            let x = scrollView.frame.width * CGFloat(index)
            imageView.frame = CGRect(x: x, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            
            imageView.sd_setImage(with: URL(string: url), completed: nil)
            imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
            imageView.contentMode = .scaleToFill
            
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(index)
            
        }
    }
    
    // MARK: - Actions
}

//MARK: - HomeView API
extension HomeView: HomeViewApi {
    func showAlert(message: String) {
        LoadingView.shared.hideActivityIndicatory(view: view)
        let alert = UIAlertController.showSimpleAlert(message: message)
        present(alert, animated: true, completion: nil)
    }
    
    func updateBanners(bannerViewModel: GenericListViewModel) {
        self.bannerViewModel = bannerViewModel
        updateScrollView()
        presenter.getCategory()
    }
    
    func updateCategory(categoryViewModel: GenericListViewModel) {
        self.categoryViewModel = categoryViewModel
        presenter.getProducts()
    }
    
    func updateProducts(productsViewModel: GenericListViewModel) {
        self.productsViewModel = productsViewModel
        presenter.getBestSellers()
    }
    
    func updatebestSellers(bestSellersViewModel: GenericListViewModel) {
        self.bestSellersViewModel = bestSellersViewModel
        tableView.reloadData()
        collectionView.reloadData()
        LoadingView.shared.hideActivityIndicatory(view: view)
    }
}

// MARK: - UIScrollViewDelegate API
extension HomeView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let pageNumber = round(scrollView.contentOffset.x / self.scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }
    }
}

// MARK: - UICollectionView API
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellReuseId(), for: indexPath) as? CategoryCell {
            cell.viewModel = categoryViewModel.itemViewModel(indexPath: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vm = categoryViewModel.itemViewModel(indexPath: indexPath) {
            presenter.goToProductsList(categoryViewModel: vm)
        }
    }
}

// MARK: - UITableView API
extension HomeView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestSellersViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.cellReuseId(), for: indexPath) as? ProductsCell {
            cell.viewModel = productsViewModel.itemViewModel(indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vm = productsViewModel.itemViewModel(indexPath: indexPath) {
            presenter.goToDetails(productViewModel: vm)
        }
    }
    
}

// MARK: - HomeView Viper Components API
private extension HomeView {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }

}
