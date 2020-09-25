//
//  UserDetailViewController.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit
import Alamofire

final class UserDetailViewController: BaseViewController {

    // MARK: - Public Properties
    var interactor: UserDetailInteractorProtocol!
    var delegate: UserDetailTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        configureTableView()
        fetchUserDetial()
    }
    
    
    // MARK: - Private Functions
    private func fetchUserDetial() {
        showLoading()
        let request = UserDetail.Fetch.Request()
        interactor.fetchFriend(request: request)
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: UserDetailCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.separatorStyle = .none
    }
    
    private func setupNavigationBarItems() {
        let cancelButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(onClickCancelButton))
        self.navigationItem.leftBarButtonItem = cancelButtonItem
        
        let doneButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        self.navigationItem.rightBarButtonItem = doneButtonItem
    }
    
    
    // MARK: - Actions
    @objc func onClickCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onClickDoneButton() {
        showLoading()
        let request = UserDetail.Update.Request()
        interactor.updateFriend(request: request)
    }

}


// MARK: - Extensions
extension UserDetailViewController: UserDetailViewProtocol {
    
    func displayFetchFriend(viewModel: UserDetail.Fetch.ViewModel) {
        hideLoading()
        delegate.dataSource = viewModel.result
        tableView.reloadData()
    }
    
    func displayUpdateFriend(viewModel: UserDetail.Update.ViewModel) {
        hideLoading()
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
