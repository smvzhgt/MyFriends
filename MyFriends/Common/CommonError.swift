//
//  CommonError.swift
//  MyFriends
//
//  Created by oleg on 04.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum CommonError: Error {
    
    case generalError(eror: Error)
    case networkError(error: Error)
    case invalidDbResult
    
    var localizedDescription: String {
        switch self {
        case let .generalError(error):
            return "Network error:\n\(error.localizedDescription)"
        case let .networkError(error):
            return "Error:\n\(error.localizedDescription)"
        case .invalidDbResult:
            return "Invalid DB result"
        }
    }
}
