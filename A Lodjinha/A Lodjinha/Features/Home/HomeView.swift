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
    var categoryViewModel = CategoryListViewModel()
    var bestSellersViewModel = GenericListViewModel()
    var productsViewModel = GenericListViewModel()
    var productViewModel = GenericListViewModel()
        
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNibCell(CategoryCell.self)
        collectionView.registerNibCell(BestSellersCell.self)
        pageControl.numberOfPages = bannerViewModel.numberOfItems
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "LogoNavBar"))
        initialRequests()
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
        print(message)
    }
    
    func updateBanners(bannerViewModel: GenericListViewModel) {
        self.bannerViewModel = bannerViewModel
        updateScrollView()
        presenter.getCategory()
    }
    
    func updateCategory(categoryViewModel: CategoryListViewModel) {
        self.categoryViewModel = categoryViewModel
        collectionView.reloadData()
        presenter.getProducts()
    }
    
    func updateProducts(productsViewModel: GenericListViewModel) {
        self.productsViewModel = productsViewModel
        presenter.getBestSellers()
    }
    
    func updatebestSellers(bestSellersViewModel: GenericListViewModel) {
        self.bestSellersViewModel = bestSellersViewModel
        LoadingView.shared.hideActivityIndicatory(view: view)
    }
}

// MARK: - UIScrollViewDelegate API
extension HomeView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categoryViewModel.numberOfItems
        } else {
            return bestSellersViewModel.numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellReuseId(), for: indexPath) as? CategoryCell {
                cell.backgroundColor = .red
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellersCell.cellReuseId(), for: indexPath) as? BestSellersCell {
                cell.backgroundColor = .black
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    
}

// MARK: - HomeView Viper Components API
private extension HomeView {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }

}
