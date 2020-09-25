//
//  FriendsPresenter.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class FriendsPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: FriendsViewProtocol!
    
}


// MARK: - Extension
extension FriendsPresenter: FriendsPresenterProtocol {
    
    func presentFetchFriends(response: Friends.Fetch.Response) {
        switch (response.users, response.error) {
        case let (.some(friends), .none):
            let viewModel = Friends.Fetch.ViewModel(result: .success(friends))
            view.displayFetchFriends(viewModel: viewModel)
        case let (.none, .some(error)):
            let viewModel = Friends.Fetch.ViewModel(result: .failure(error))
            view.displayFetchFriends(viewModel: viewModel)
        case  (.some(_), .some(_)),  (.none, .none):
            let error = CommonError.invalidDbResult
            let viewModel = Friends.Fetch.ViewModel(result: .failure(error))
            view.displayFetchFriends(viewModel: viewModel)
        }
    }
    
    func presentDeleteUserFromFriends(response: Friends.Update.Response) {
        let viewModel = Friends.Update.ViewModel(error: response.error)
        view.displayDeleteUserFromFriends(viewModel: viewModel)
    }
    
}
