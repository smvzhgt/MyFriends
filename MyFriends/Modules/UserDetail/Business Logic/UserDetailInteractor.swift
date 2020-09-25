//
//  UserDetailInteractor.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class UserDetailInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: UserDetailPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: UserServiceProtocol
    private var user: UserModel
    private var firstName: String
    private var lastName: String
    private var email: String
    private var phone: String
    
    
    // MARK: - Initializers
    init(user: UserModel, presenter: UserDetailPresenterProtocol, service: UserServiceProtocol = UserService()) {
        self.user = user
        self.presenter = presenter
        self.service = service
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.email = user.email
        self.phone = user.phone
        super.init()
    }
    
    
    // MARK: - Private Functions
    private func createUserToUpdate() -> UserModel {
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.phone = phone
        return user
    }

}


// MARK: - Extension
extension UserDetailInteractor: UserDetailInteractorProtocol {

    func fetchFriend(request: UserDetail.Fetch.Request) {
        let response = UserDetail.Fetch.Response(result: user)
        presenter.presentFetchFriend(response: response)
    }
    
    func updateFriend(request: UserDetail.Update.Request) {
        let user = createUserToUpdate()
        service.updateFriendEntity(friend: user) { [weak self] error in
            let response = UserDetail.Update.Response(error: error)
            self?.presenter.presentUpdateFriend(response: response)
        }
    }
    
}


extension UserDetailInteractor: FillTextFieldProtocol {
    
    func handleFillTextField(tag: Int, message: String?) {
        switch tag {
        case TextFieldTag.firstName.rawValue:
            firstName = message ?? user.firstName
        case TextFieldTag.lastName.rawValue:
            lastName = message ?? user.lastName
        case TextFieldTag.phone.rawValue:
            phone = message ?? user.phone
        case TextFieldTag.email.rawValue:
            email = message ?? user.email
        default: break
        }
    }
    
}
