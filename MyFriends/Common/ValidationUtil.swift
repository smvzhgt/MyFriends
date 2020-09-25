//
//  ValidationUtil.swift
//  MyFriends
//
//  Created by oleg on 07.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

class ValidationUtil: NSObject {
    
    static func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    static func isEmpty(string: String?) -> Bool {
        return string == nil || string!.isEmptyString
    }
    
}
