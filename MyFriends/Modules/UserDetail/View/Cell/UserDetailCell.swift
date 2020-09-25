//
//  UserDetailCell.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit
import Alamofire

final class UserDetailCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let cellHeight: CGFloat = 420
    static let cellIdentifier: String = "UserDetailCell"
    weak var textFieldDelegate: FillTextFieldProtocol?
    
    
    // MARK: - Outlets
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var firstName: UITextField!
    @IBOutlet private weak var lastName: UITextField!
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var phone: UITextField!
    
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatar.image = nil
        firstName.text = nil
        lastName.text = nil
        email.text = nil
        phone.text = nil
    }
    
    
    // MARK: - Private Functions
    private func setupUI() {
        selectionStyle = .none
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 25
        
        firstName.tag = TextFieldTag.firstName.rawValue
        firstName.delegate = self
        
        lastName.tag = TextFieldTag.lastName.rawValue
        lastName.delegate = self
        
        email.tag = TextFieldTag.email.rawValue
        email.delegate = self
        
        phone.tag = TextFieldTag.phone.rawValue
        phone.delegate = self
    }
    
}


// MARK: - Extensions
extension UserDetailCell {
    
    func fill(model: UserModel) {

        AF.request(model.avatarUrlLarge)
            .validate()
            .responseData { (response: AFDataResponse<Data>) in
                guard let data = response.data else { return }
                self.avatar.image = UIImage(data: data)
        }
        
        firstName.text = model.firstName
        lastName.text = model.lastName
        email.text = model.email
        phone.text = model.phone
    }
    
}


extension UserDetailCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return true }
        
        switch textField.tag {
        case TextFieldTag.firstName.rawValue:
            textFieldDelegate?.handleFillTextField(tag: textField.tag, message: updatedString)
        case TextFieldTag.lastName.rawValue:
            textFieldDelegate?.handleFillTextField(tag: textField.tag, message: updatedString)
        case TextFieldTag.lastName.rawValue:
            textFieldDelegate?.handleFillTextField(tag: textField.tag, message: updatedString)
        case TextFieldTag.email.rawValue:
            if ValidationUtil.isValid(email: updatedString) {
                email.textColor = UIColor.black
                textFieldDelegate?.handleFillTextField(tag: textField.tag, message: updatedString)
            } else {
                email.textColor = UIColor.red
            }
        default: break
        }
        
        return true
    }
    
}
