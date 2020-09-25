//
//  UserModel.swift
//  MyFriends
//
//  Created by oleg on 07.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

struct UserModel {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var avatarUrlThumbnail: String
    var avatarUrlMedium: String
    var avatarUrlLarge: String
    var isFriend: Bool
    
    init(friendModel: FriendEntity) {
        self.id = friendModel.id ?? getUUID()
        self.firstName = friendModel.firstName ?? ""
        self.lastName = friendModel.lastName ?? ""
        self.email = friendModel.email ?? ""
        self.phone = friendModel.phone ?? ""
        self.avatarUrlThumbnail = friendModel.avatarUrlThumbnail ?? ""
        self.avatarUrlMedium = friendModel.avatarUrlMedium ?? ""
        self.avatarUrlLarge = friendModel.avatarUrlLarge ?? ""
        self.isFriend = friendModel.isFriend
    }
    
    init(userResponseModel: UserResponseModel) {
        self.id = ""
        self.firstName = userResponseModel.name?.first ?? ""
        self.lastName = userResponseModel.name?.last ?? ""
        self.email = userResponseModel.email ?? ""
        self.phone = userResponseModel.phone ?? ""
        self.avatarUrlThumbnail = userResponseModel.picture?.thumbnail ?? ""
        self.avatarUrlMedium = userResponseModel.picture?.thumbnail ?? ""
        self.avatarUrlLarge = userResponseModel.picture?.large ?? ""
        self.isFriend = false
    }
    
}
