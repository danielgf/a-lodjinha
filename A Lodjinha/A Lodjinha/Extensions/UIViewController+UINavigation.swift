//
//  ViewController+UINavigation.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc func dismissIt() {
        (navigationController ?? self).dismiss(animated: true, completion: nil)
    }
    
    func embedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
}

extension UINavigationController {
    
    func popViewController(animated: Bool, completion: @escaping (() -> Void)) {
        popViewController(animated: animated)
        doAfterAnimatingTransition(animated: animated, completion: completion)
    }
    
    private func doAfterAnimatingTransition(animated: Bool, completion: @escaping (() -> Void)) {
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil, completion: { _ in
                completion()
            })
        } else {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
