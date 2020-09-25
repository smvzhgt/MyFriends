//
//  UserDetailPresenter.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class UserDetailPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: UserDetailViewProtocol!
    
}


// MARK: - Extension
extension UserDetailPresenter: UserDetailPresenterProtocol {
    
    func presentFetchFriend(response: UserDetail.Fetch.Response) {
        let result = [response.result]
        let viewModel = UserDetail.Fetch.ViewModel(result: result)
        view.displayFetchFriend(viewModel: viewModel)
    }
    
    func presentUpdateFriend(response: UserDetail.Update.Response) {
        let viewModel = UserDetail.Update.ViewModel(error: response.error)
        view.displayUpdateFriend(viewModel: viewModel)
    }
    
}
