//
//  Result.swift
//  MyFriends
//
//  Created by oleg on 04.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

enum Result<T> {
    case success(T)
    case failure(CommonError)
}
