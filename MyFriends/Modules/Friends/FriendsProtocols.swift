//
//  FriendsProtocols.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol FriendsInteractorProtocol: class {
    func fetchFriends(request: Friends.Fetch.Request)
    func deleteUserFromFriends(request: Friends.Update.Request)
}

// MARK: - Presentation Protocol
protocol FriendsPresenterProtocol: class {
    func presentFetchFriends(response: Friends.Fetch.Response)
    func presentDeleteUserFromFriends(response: Friends.Update.Response)
}


// MARK: - View Protocol
protocol FriendsViewProtocol: class {
    func displayFetchFriends(viewModel: Friends.Fetch.ViewModel)
    func displayDeleteUserFromFriends(viewModel: Friends.Update.ViewModel)
}


// MARK: - TableViewProtocol
protocol FriendsInteractionProtocol: class {
    func deleteUserFromFriends(user: UserModel)
    func openDetailScreen(user: UserModel)
}
