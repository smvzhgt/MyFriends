//
//  FriendsFlow.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum Friends {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            let users: [UserModel]?
            let error: CommonError?
        }
        
        struct ViewModel {
            let result: Result<[UserModel]>
        }
        
    }
    
    enum Update {
        
        struct Request {
            let user: UserModel
        }
        
        struct Response {
            let error: CommonError?
        }
        
        struct ViewModel {
            let error: CommonError?
        }

    }

}
