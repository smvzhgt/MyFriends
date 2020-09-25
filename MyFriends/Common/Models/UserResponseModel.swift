//
//  UserResponseModel.swift
//  MyFriends
//
//  Created by oleg on 04.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

class UsersResponseModel: Codable {
    var users: [UserResponseModel] = []
    
    init(users: [UserResponseModel]) {
        self.users = users
    }
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
    
}


class UserResponseModel: Codable {
    
    var email: String?
    var phone: String?
    var name: UserName?
    var picture: UserPicture?
    
    init(email: String, phone: String, name: UserName, picture: UserPicture) {
        self.email = email
        self.phone = phone
        self.name = name
        self.picture = picture
    }
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case phone = "phone"
        case name = "name"
        case picture = "picture"
    }
    
    
    class UserName: Codable {
        
        var first: String?
        var last: String?
        
        init(first: String, last: String) {
            self.first = first
            self.last = last
        }
        
        enum CodingKeys: String, CodingKey {
            case first = "first"
            case last = "last"
        }
    }
    
    
    class UserPicture: Codable {
        
        var large: String?
        var medium: String?
        var thumbnail: String?
        
        init(large: String, medium: String, thumbnail: String) {
            self.large = large
            self.medium = medium
            self.thumbnail = thumbnail
        }
        
        enum CodingKeys: String, CodingKey {
            case large = "large"
            case medium = "medium"
            case thumbnail = "thumbnail"
        }
    }
    
}
