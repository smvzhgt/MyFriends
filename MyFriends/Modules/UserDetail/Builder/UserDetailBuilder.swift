//
//  UserDetailBuilder.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class UserDetailBuilder: ModuleBuilder {

    // MARK: - Public Properties
    var user: UserModel

    
    // MARK: - Initializers
    init(user: UserModel) {
        self.user = user
    }


    // MARK: - Public Functions
    func build() -> UIViewController {
        // Presenter
        let presenter = UserDetailPresenter()
        
        // Interactor
        let interactor = UserDetailInteractor(user: user, presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "UserDetail", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
        
        let tableViewDelegate = UserDetailTableViewDelegate(fillTextFieldProtocol: interactor)
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
