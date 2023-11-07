//
//  UserDefaultsHandler.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 06.11.23.
//

import UIKit

class UserDefaultsHandler {
    static let loginKey = "com.myNotes.loginKey22"
    
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: loginKey)
    }
    
    static func setLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: loginKey)
    }
}
