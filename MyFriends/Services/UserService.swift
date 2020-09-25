//
//  UserService.swift
//  MyFriends
//
//  Created by oleg on 04.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

protocol UserServiceProtocol: class {
    func fetchUsets(page: Int, count: Int, completion: @escaping (_ response: [UserResponseModel]?, _ error: CommonError?) -> ())
    func saveFriendEntity(user: UserModel, completion: @escaping (_ error: CommonError?) -> ())
    func fetchFriendEntites(completion: @escaping (_ response: [UserModel]?, _ error: CommonError?) -> ())
    func fetchFriendEntity(id: String, completion: @escaping (_ response: UserModel?, _ error: CommonError?) -> ())
    func updateFriendEntity(friend: UserModel, completion: @escaping (_ error: CommonError?) -> ())
}


final class UserService: NSObject {
    let coreDataStack = CoreDataStack.shared
}


// MARK: - Extension
extension UserService: UserServiceProtocol {
    
    // Fetch all users
    func fetchUsets(page: Int, count: Int, completion: @escaping ([UserResponseModel]?, CommonError?) -> ()) {
        let url = "https://randomuser.me/api/?page=\(page)&results=\(count)&seed=abc"
        AF.request(url)
            .validate()
            .responseDecodable { (response: DataResponse<UsersResponseModel, AFError>) in
                switch response.result {
                case .success(let objectResponse):
                    completion(objectResponse.users, nil)
                case .failure(let error):
                    completion(nil, CommonError.networkError(error: error))
                }
        }
    }
    
    // Save friend entity
    func saveFriendEntity(user: UserModel, completion: @escaping (CommonError?) -> ()) {
        let _ = FriendEntity.createFriedEntity(user: user)
        coreDataStack.saveContext()
        completion(nil)
    }
    
    // Fetch all entities
    func fetchFriendEntites(completion: @escaping ([UserModel]?, CommonError?) -> ()) {
        let fetchRequest: NSFetchRequest<FriendEntity> = FriendEntity.fetchRequest()
        let predicate = NSPredicate(format: "isFriend == %d", 1)
        fetchRequest.predicate = predicate
        
        let asyncRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { result in
            guard let friendEntities = result.finalResult else {
                return completion(nil, CommonError.invalidDbResult)
            }
            
            let friends = friendEntities.map({ user in
                return UserModel(friendModel: user)
            })
            
            DispatchQueue.main.async {
                completion(friends, nil)
            }
        }
        
        do {
            let backgroundContext = coreDataStack.persistentContainer.newBackgroundContext()
            try backgroundContext.execute(asyncRequest)
        } catch let error {
            return completion(nil, CommonError.generalError(eror: error))
        }
    }
    
    // Fetch friend entity by id
    func fetchFriendEntity(id: String, completion: @escaping (UserModel?, CommonError?) -> ()) {
        let fetchRequest: NSFetchRequest<FriendEntity> = FriendEntity.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = predicate
        
        let asyncRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { result in
            guard let friendEntity = result.finalResult?.first else {
                return completion(nil, CommonError.invalidDbResult)
            }
            
            let friend = UserModel(friendModel: friendEntity)
            DispatchQueue.main.async {
                completion(friend, nil)
            }
        }
        
        do {
            let backgroundContext = coreDataStack.persistentContainer.newBackgroundContext()
            try backgroundContext.execute(asyncRequest)
        } catch let error {
            return completion(nil, CommonError.generalError(eror: error))
        }
    }
    
    // Update friend entity
    func updateFriendEntity(friend: UserModel, completion: @escaping (CommonError?) -> ()) {
        coreDataStack.persistentContainer.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<FriendEntity> = FriendEntity.fetchRequest()
            let predicate = NSPredicate(format: "id == %@", friend.id)
            fetchRequest.predicate = predicate
            
            do {
                let result = try context.fetch(fetchRequest)
                if let entity = result.first {
                    entity.id = friend.id
                    entity.firstName = friend.firstName
                    entity.lastName = friend.lastName
                    entity.email = friend.email
                    entity.phone = friend.phone
                    entity.avatarUrlThumbnail = friend.avatarUrlThumbnail
                    entity.avatarUrlMedium = friend.avatarUrlMedium
                    entity.avatarUrlLarge = friend.avatarUrlLarge
                    entity.isFriend = friend.isFriend
                    
                    try context.save()
                    
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        completion(CommonError.invalidDbResult)
                    }
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(CommonError.invalidDbResult)
                }
            }
        }
    }
        
}
