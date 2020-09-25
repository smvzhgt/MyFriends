//
//  String+Extension.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

extension String {
    var isEmptyString: Bool {
        return trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
}

func getUUID() -> String {
    return UUID().uuidString.replacingOccurrences(of: "-", with: "")
}



