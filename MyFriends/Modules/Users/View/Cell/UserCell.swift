//
//  UserCell.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit
import Alamofire

final class UserCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let cellHeight: CGFloat = 88
    static let cellIdentifier: String = "UserCell"
    
    
    // MARK: - Outlets
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet private weak var avatar: UIImageView!
    
    
    // MARK: Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatar.image = nil
        firstNameLabel.text = nil
        lastNameLabel.text = nil
    }
    
}


// MARK: - Extensions
extension UserCell {
    
    func fill(model: UserModel) {
        firstNameLabel.text = model.firstName
        lastNameLabel.text = model.lastName
        
        AF.request(model.avatarUrlLarge)
            .validate()
            .responseData { (response: AFDataResponse<Data>) in
                guard let data = response.data else { return }
                self.avatar.image = UIImage(data: data)
        }
    }
    
}

