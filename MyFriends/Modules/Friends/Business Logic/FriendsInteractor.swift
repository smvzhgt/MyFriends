//
//  FriendsInteractor.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class FriendsInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: FriendsPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: UserServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: FriendsPresenterProtocol, service: UserServiceProtocol = UserService()) {
        self.presenter = presenter
        self.service = service
        super.init()
    }
    
}


// MARK: - Extension
extension FriendsInteractor: FriendsInteractorProtocol {
    
    func fetchFriends(request: Friends.Fetch.Request) {
        service.fetchFriendEntites { [weak self] friends, error in
            let response = Friends.Fetch.Response(users: friends, error: error)
            self?.presenter.presentFetchFriends(response: response)
        }
    }
    
    func deleteUserFromFriends(request: Friends.Update.Request) {
        service.updateFriendEntity(friend: request.user) { [weak self] error in
            let response = Friends.Update.Response(error: error)
            self?.presenter.presentDeleteUserFromFriends(response: response)
        }
    }
    
}
