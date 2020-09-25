//
//  UsersFlow.swift
//  MyFriends
//
//  Created by oleg on 03.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum Users {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            let result: Result<[UserResponseModel]?>
        }
        
        struct ViewModel {
            let result: Result<[UserModel]>
        }

    }
    
    
    enum FetchMore {
        struct Request {
            
        }
        
        struct Response {
            let result: Result<[UserResponseModel]?>
        }
        
        struct ViewModel {
            let result: Result<[UserModel]>
        }
    }
    
    enum AddFriend {
        struct Request {
            let model: UserModel
        }
        
        struct Response {
            let result: CommonError?
        }
        
        struct ViewModel {
            let result: CommonError?
        }
    }
    
}
