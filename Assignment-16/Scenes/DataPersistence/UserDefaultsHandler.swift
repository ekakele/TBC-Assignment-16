//
//  UserDefaultsHandler.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 06.11.23.
//

import UIKit

final class UserDefaultsHandler {
    
    struct Keys {
        static let loginKey = "com.eka.myNotes.loginKey"
        static let noteKey = "com.eka.myNotes.noteKey"
    }

    //    MARK: - User LogIn Save & Get Methods
    static func setLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: Keys.loginKey)
    }
    
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.loginKey)
    }
    
    //    MARK: - Notes Save Method
    
    static func saveNotes(noteToSave: Data?) {
        UserDefaults.standard.setValue(noteToSave, forKey: Keys.noteKey)
    }
    
    static func getNotes() -> Data? {
        UserDefaults.standard.data(forKey: Keys.noteKey)
    }
}
