//
//  UserDefault.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import Foundation

class UserDefault {
    
    static let shared = UserDefault()
    
    
    func saveToken(token: String?) {
        UserDefaults.standard.set(token, forKey: Constants.uid)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: Constants.uid)
        UserDefaults.standard.removeObject(forKey: Constants.imagesStringArray)
    }
    
    func isUserLoggedIn() -> Bool {
       getToken()?.isEmpty == false
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: Constants.uid)
    }
    
}
