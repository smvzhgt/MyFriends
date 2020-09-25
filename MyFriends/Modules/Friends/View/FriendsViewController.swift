//
//  FriendsViewController.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class FriendsViewController: BaseViewController {

    // MARK: - Public Properties
    var interactor: FriendsInteractorProtocol!
    var delegate: FriendsTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var footerView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchFriends()
    }
    
    
    // MARK: - Private Functions
    private func fetchFriends() {
        showLoading()
        let request = Friends.Fetch.Request()
        interactor.fetchFriends(request: request)
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: FriendCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: FriendCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.setEditing(true, animated: true)
        tableView.allowsSelectionDuringEditing = true
        
    }
    
    private func setupNavigationBarItems() {
        let usersButtonItem = UIBarButtonItem(title: "Users", style: .done, target: self, action: #selector(showUsers))
        self.navigationItem.rightBarButtonItem  = usersButtonItem
    }
    
    
    // MARK: - Actions
    @objc func showUsers() {
        let controller = UsersBuilder().build()
        navigationController?.pushViewController(controller, animated: true)
    }

}


// MARK: - Extensions
extension FriendsViewController: FriendsViewProtocol {
    
    func displayFetchFriends(viewModel: Friends.Fetch.ViewModel) {
        hideLoading()
        switch viewModel.result {
        case .success(let friends):
            delegate.dataSource = friends
            tableView.reloadData()
        case .failure(let error):
            showWarningDialog(message: error.localizedDescription)
        }
    }
    
    func displayDeleteUserFromFriends(viewModel: Friends.Update.ViewModel) {
        hideLoading()
        guard let error = viewModel.error else { return }
        showWarningDialog(message: error.localizedDescription)
    }
    
}

extension FriendsViewController: FriendsInteractionProtocol {
    
    func deleteUserFromFriends(user: UserModel) {
        showLoading()
        let request = Friends.Update.Request(user: user)
        interactor.deleteUserFromFriends(request: request)
    }
    
    func openDetailScreen(user: UserModel) {
        let viewController = UserDetailBuilder(user: user).build()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
