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
    var bannerViewModel = BannersListViewModel()
        
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNibCell(CategoryCell.self)
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
    
    func updateBanners(bannerViewModel: BannersListViewModel) {
        LoadingView.shared.hideActivityIndicatory(view: view)
        self.bannerViewModel = bannerViewModel
        updateScrollView()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellReuseId(), for: indexPath) as? CategoryCell {
            cell.backgroundColor = .red
            return cell
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
