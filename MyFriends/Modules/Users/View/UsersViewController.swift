//
//  UsersViewController.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class UsersViewController: BaseViewController {

    // MARK: - Public Properties
    var interactor: UsersInteractorProtocol!
    var delegate: UsersTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var footerView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchUsers()
    }
    
    
    // MARK: - Private Functions
    private func fetchUsers() {
        showLoading()
        let request = Users.Fetch.Request()
        interactor.fetchUsers(request: request)
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: UserCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }

}


// MARK: - Extensions
extension UsersViewController: UsersViewProtocol {
    
    func displayFetchUsers(viewModel: Users.Fetch.ViewModel) {
        hideLoading()
        switch viewModel.result {
        case .success(let users):
            delegate.dataSource = users
            tableView.reloadData()
        case .failure(let error):
            showWarningDialog(message: error.localizedDescription)
        }
    }
    
    func displayFetchMoreUsers(viewModel: Users.FetchMore.ViewModel) {
        switch viewModel.result {
        case .success(let users):
            let allUsers = delegate.dataSource + users
            delegate.dataSource = allUsers
            delegate.isLoading = false
            hideTableFooter()
            tableView.reloadData()
        case .failure(let error):
            showWarningDialog(message: error.localizedDescription)
        }
    }
    
    func displayAddUserToFriend(viewModel: Users.AddFriend.ViewModel) {
        guard let error = viewModel.result else { return }
        showWarningDialog(message: error.localizedDescription)
    }
    
}


extension UsersViewController: UsersInteractionProtocol {
    
    func fetchMoreUsers() {
        let request = Users.FetchMore.Request()
        interactor.fetchFetchMoreUsers(request: request)
    }
    
    func showTableFooter() {
        tableView.tableFooterView = footerView
        activityIndicator.startAnimating()
    }
    
    func hideTableFooter() {
        activityIndicator.stopAnimating()
        tableView.tableFooterView = nil
    }
    
    func addUserToFriend(user: UserModel) {
        let request = Users.AddFriend.Request(model: user)
        interactor.addUserToFriend(request: request)
    }
    
}
