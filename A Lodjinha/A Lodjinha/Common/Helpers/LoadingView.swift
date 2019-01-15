//
//  LoadingView.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/14/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let shared = LoadingView()
    
    func showActivityIndicatory(view: UIView) {
        container.frame = view.frame
        container.center = view.center
        container.backgroundColor = UIColor(hexString: HexColor.containerView.rawValue)
        container.backgroundColor?.withAlphaComponent(0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(hexString: HexColor.loadingView.rawValue)
        container.backgroundColor?.withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicatory(view: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }


}
