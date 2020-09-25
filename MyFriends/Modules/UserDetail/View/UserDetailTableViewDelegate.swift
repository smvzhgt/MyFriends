//
//  UserDetailTableViewDelegate.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class UserDetailTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [UserModel]
    var fillTextFieldProtocol: FillTextFieldProtocol
    
    
    // MARK: - Initializers
    init(fillTextFieldProtocol: FillTextFieldProtocol, dataSource: [UserModel] = []) {
        self.dataSource = dataSource
        self.fillTextFieldProtocol = fillTextFieldProtocol
    }
    
}


// MARK: - UITableView Data Source
extension UserDetailTableViewDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailCell.cellIdentifier) as? UserDetailCell {
            cell.textFieldDelegate = fillTextFieldProtocol
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
extension UserDetailTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserDetailCell.cellHeight
    }
    
}
