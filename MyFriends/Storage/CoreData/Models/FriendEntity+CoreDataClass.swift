//
//  FriendEntity+CoreDataClass.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//
//

import Foundation
import CoreData

@objc(FriendEntity)
public class FriendEntity: NSManagedObject {
    
    convenience init() {
        let entity = NSEntityDescription.entity(forEntityName: "FriendEntity", in: CoreDataStack.shared.persistentContainer.viewContext)
        
        self.init(entity: entity!, insertInto: CoreDataStack.shared.persistentContainer.viewContext)
    }
    
    class func createFriedEntity(user: UserModel) -> FriendEntity {
        let entity = FriendEntity()
        entity.id = getUUID()
        entity.firstName = user.firstName
        entity.lastName = user.lastName
        entity.email = user.email
        entity.phone = user.phone
        entity.avatarUrlThumbnail = user.avatarUrlThumbnail
        entity.avatarUrlMedium = user.avatarUrlMedium
        entity.avatarUrlLarge = user.avatarUrlLarge
        entity.isFriend = true
        return entity
    }
    
}
