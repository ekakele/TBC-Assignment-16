//
//  KeyChainHandler.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 06.11.23.
//

import UIKit

class KeyChainHandler {
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case noDataFound
        case KCErrorWithCode(Int)
    }
    
    static func save(
        service: String,
        account: String,
        data: String
    ) {
        let dataFromPasswordString = data.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: dataFromPasswordString as AnyObject,
        ]
        
        _ = SecItemAdd(query as CFDictionary, nil)
    }
    
    static func get(
        service: String,
        account: String
    ) -> String? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            return String(data: result as! Data, encoding: .utf8)
        } else {
            print("Invalid password")
            return nil
        }
        
    }
}
