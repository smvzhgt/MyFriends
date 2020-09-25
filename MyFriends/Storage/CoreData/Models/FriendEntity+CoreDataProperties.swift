//
//  FriendEntity+CoreDataProperties.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendEntity> {
        return NSFetchRequest<FriendEntity>(entityName: "FriendEntity")
    }

    @NSManaged public var avatarUrlLarge: String?
    @NSManaged public var avatarUrlMedium: String?
    @NSManaged public var avatarUrlThumbnail: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var isFriend: Bool
    @NSManaged public var lastName: String?
    @NSManaged public var phone: String?
    @NSManaged public var id: String?

}
