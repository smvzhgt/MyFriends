//
//  UsersTableViewDelegate.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class UsersTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [UserModel]
    var usersInteraction: UsersInteractionProtocol
    var isLoading: Bool = false
    
    
    // MARK: - Initializers
    init(usersInteraction: UsersInteractionProtocol, presentationModels: [UserModel] = []) {
        self.dataSource = presentationModels
        self.usersInteraction = usersInteraction
    }
    
}


// MARK: - UITableView Data Source
extension UsersTableViewDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row

        if row == dataSource.count - 1 && !isLoading {
            isLoading = true
            usersInteraction.showTableFooter()
            usersInteraction.fetchMoreUsers()
        }
        
        let model = dataSource[row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellIdentifier) as? UserCell {
            cell.fill(model: model)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}


// MARK: - UITableView Delegate
extension UsersTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        usersInteraction.addUserToFriend(user: model)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
}
