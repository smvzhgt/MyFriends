//
//  UserDetailProtocols.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol UserDetailInteractorProtocol: class {
    func fetchFriend(request: UserDetail.Fetch.Request)
    func updateFriend(request: UserDetail.Update.Request)
}

// MARK: - Presentation Protocol
protocol UserDetailPresenterProtocol: class {
    func presentFetchFriend(response: UserDetail.Fetch.Response)
    func presentUpdateFriend(response: UserDetail.Update.Response)
}

// MARK: - View Protocol
protocol UserDetailViewProtocol: class {
    func displayFetchFriend(viewModel: UserDetail.Fetch.ViewModel)
    func displayUpdateFriend(viewModel: UserDetail.Update.ViewModel)
}

// MARK: - Protocol TextField
protocol FillTextFieldProtocol: class {
    func handleFillTextField(tag: Int, message: String?)
}
