//
//  FriendsTableViewDelegate.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class FriendsTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [UserModel]
    var friendsInteraction: FriendsInteractionProtocol
    
    
    // MARK: - Initializers
    init(friendsInteraction: FriendsInteractionProtocol, dataSource: [UserModel] = []) {
        self.dataSource = dataSource
        self.friendsInteraction = friendsInteraction
    }
    
}


// MARK: - UITableView Data Source
extension FriendsTableViewDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.cellIdentifier) as? FriendCell {
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
extension FriendsTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FriendCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = dataSource[indexPath.row]
        friendsInteraction.openDetailScreen(user: user)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var user = dataSource[indexPath.row]
            user.isFriend = false
            friendsInteraction.deleteUserFromFriends(user: user)
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
