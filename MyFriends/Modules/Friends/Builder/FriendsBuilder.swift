//
//  FriendsBuilder.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class FriendsBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = FriendsPresenter()
        
        // Interactor
        let interactor = FriendsInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Friends", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "FriendsViewController") as! FriendsViewController
        
        let tableViewDelegate = FriendsTableViewDelegate(friendsInteraction: controller)
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
