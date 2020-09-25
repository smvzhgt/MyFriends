//
//  UIViewController+Extensions.swift
//  MyFriends
//
//  Created by oleg on 04.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChildViewController(childViewController child: UIViewController?) {
        guard let child = child, child.parent == nil else {
            return
        }
        addChild(child)
        view.addSubview(child.view)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: child.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
        ]
        constraints.forEach { $0.isActive = true }
        view.addConstraints(constraints)
        
        child.didMove(toParent: self)
    }
    
    func removeChildViewController(childViewController child: UIViewController?) {
        guard let child = child else {
            return
        }
        guard child.parent != nil else {
            return
        }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    func showWarningDialog(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Ok", style: .default) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
