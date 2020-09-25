//
//  UserDetailFlow.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum UserDetail {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            let result: UserModel
        }
        
        struct ViewModel {
            let result: [UserModel]
        }
        
    }
    
    enum Update {
        
        struct Request {
            
        }
        
        struct Response {
            let error: CommonError?
        }
        
        struct ViewModel {
            let error: CommonError?
        }
    }
    
}
