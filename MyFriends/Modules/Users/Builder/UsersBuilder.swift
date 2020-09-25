//
//  UsersBuilder.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class UsersBuilder: ModuleBuilder {

    init() {}
    
    func build() -> UIViewController {
        
        // Presenter
        let presenter = UsersPresenter()
        
        // Interactor
        let interactor = UsersInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Users", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "UsersViewController") as! UsersViewController
        
        let tableViewDelegate = UsersTableViewDelegate(usersInteraction: controller)
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
