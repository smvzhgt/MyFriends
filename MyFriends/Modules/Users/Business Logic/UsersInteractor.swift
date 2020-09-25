//
//  UsersInteractor.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class UsersInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: UsersPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: UserServiceProtocol
    private var pageNumber: Int = 1
    private var count: Int = 20
    
    
    // MARK: - Initializers
    init(presenter: UsersPresenterProtocol, service: UserServiceProtocol = UserService()) {
        self.presenter = presenter
        self.service = service
        super.init()
    }

}


// MARK: - Extension
extension UsersInteractor: UsersInteractorProtocol {
    
    func fetchUsers(request: Users.Fetch.Request) {
        service.fetchUsets(page: pageNumber, count: count) { [weak self] users, error in
            let response = Users.Fetch.Response(result: .success(users))
            self?.presenter.presentFetchUsers(response: response)
        }
    }
    
    func fetchFetchMoreUsers(request: Users.FetchMore.Request) {
        pageNumber = pageNumber + 1
        service.fetchUsets(page: pageNumber, count: count) { [weak self] users, error in
            let response = Users.FetchMore.Response(result: .success(users))
            self?.presenter.presentFetchMoreUsers(response: response)
        }
    }
    
    func addUserToFriend(request: Users.AddFriend.Request) {
        let result = request.model
        service.saveFriendEntity(user: result) { [weak self] error in
            let response = Users.AddFriend.Response(result: error)
            self?.presenter.presentAddUserToFriend(response: response)
        }
    }
    
}
