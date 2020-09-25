//
//  BaseViewController.swift
//  MyFriends
//
//  Created by oleg on 07.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Public Properties
    var loadingViewController: UIViewController?
    
    
    // MARK: - Private Functions
    internal func showLoading() {
        loadingViewController = LoadingBuilder().build()
        addChildViewController(childViewController: loadingViewController)
    }
    
    internal func hideLoading() {
        removeChildViewController(childViewController: loadingViewController)
        loadingViewController = nil
    }
    
}
