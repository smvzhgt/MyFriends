//
//  UsersProtocols.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol UsersInteractorProtocol: class {
    func fetchUsers(request: Users.Fetch.Request)
    func fetchFetchMoreUsers(request: Users.FetchMore.Request)
    func addUserToFriend(request: Users.AddFriend.Request)
}

// MARK: - Presentation Protocol
protocol UsersPresenterProtocol: class {
    func presentFetchUsers(response: Users.Fetch.Response)
    func presentFetchMoreUsers(response: Users.FetchMore.Response)
    func presentAddUserToFriend(response: Users.AddFriend.Response)
}


// MARK: - View Protocol
protocol UsersViewProtocol: class {
    func displayFetchUsers(viewModel: Users.Fetch.ViewModel)
    func displayFetchMoreUsers(viewModel: Users.FetchMore.ViewModel)
    func displayAddUserToFriend(viewModel: Users.AddFriend.ViewModel)
}


// MARK: - TableViewProtocol
protocol UsersInteractionProtocol: class {
    func showTableFooter()
    func hideTableFooter()
    func fetchMoreUsers()
    func addUserToFriend(user: UserModel)
}
