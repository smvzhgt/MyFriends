//
//  UsersPresenter.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class UsersPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: UsersViewProtocol!
    
}


// MARK: - Extension
extension UsersPresenter: UsersPresenterProtocol {
    
    func presentFetchUsers(response: Users.Fetch.Response) {
        switch response.result {
        case .success(let result):
            let users = result ?? []
            let presentationModels = users.map({ userModel -> UserModel in
                return UserModel(userResponseModel: userModel)
            })
            let viewModel = Users.Fetch.ViewModel(result: .success(presentationModels))
            view.displayFetchUsers(viewModel: viewModel)
                
        case .failure(let error):
            let viewModel = Users.Fetch.ViewModel(result: .failure(error))
            view.displayFetchUsers(viewModel: viewModel)
            
        }
    }
    
    func presentFetchMoreUsers(response: Users.FetchMore.Response) {
        switch response.result {
        case .success(let result):
            let users = result ?? []
            let presentationModels = users.map({ userModel -> UserModel in
                return UserModel(userResponseModel: userModel)
            })
            let viewModel = Users.FetchMore.ViewModel(result: .success(presentationModels))
            view.displayFetchMoreUsers(viewModel: viewModel)
                
        case .failure(let error):
            let viewModel = Users.FetchMore.ViewModel(result: .failure(error))
            view.displayFetchMoreUsers(viewModel: viewModel)
        }
    }
    
    func presentAddUserToFriend(response: Users.AddFriend.Response) {
        let viewModel = Users.AddFriend.ViewModel(result: response.result)
        view.displayAddUserToFriend(viewModel: viewModel)
    }
    
}
