//
//  LoadingViewController.swift
//  MyFriends
//
//  Created by oleg on 24.12.2019.
//  Copyright © 2019 tets. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController {

    // MARK: - Private Properties
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sutupUI()
    }
    
    
    // MARK: - Private Functions
    private func sutupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        activityIndicator.startAnimating()
    }
    
}
