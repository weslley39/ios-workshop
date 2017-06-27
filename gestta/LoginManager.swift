//
//  LoginManager.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit
import KeychainAccess

class LoginManager {
    
    lazy var loginService: LoginServiceProtocol = LoginService()
    lazy var userService: UserServiceProtocol = UserService()
    
    static var hasUserLogged: Bool {
        return User.findFirst() != nil
    }
    
    static var user: User? {
        return User.findFirst()
    }
    
    private static let token = "br.com.gestta.user.token"
    static var accessToken: String {
        get {
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
                return UserDefaults.standard.string(forKey: LoginManager.token)!
            #else
                return keychain[LoginManager.token]!
            #endif
        }
        set {
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
                UserDefaults.standard.set(newValue, forKey: LoginManager.token)
                UserDefaults.standard.synchronize()
            #else
                keychain[LoginManager.token] = newValue
            #endif
        }
    }
    
    fileprivate static var keychain: Keychain {
        return Keychain(service: "br.com.gestta.data")
    }
    
    func logout() {
        
    }
    
    func performLogin(email: String, password: String, success:@escaping (User) -> (), failure:@escaping (RSError) -> ()) {
        loginService.performLogin(email: email, password: password) { (response) in
            if response.isSuccess {
                LoginManager.accessToken = response.data!
                self.loadUserData(success: success, failure: failure)
            }
            else {
                failure(response.error!)
            }
        }
    }
    
    fileprivate func loadUserData(success:@escaping (User) -> (), failure:@escaping (RSError) -> ()) {
        userService.me { (response) in
            if response.isSuccess {
                success(response.data!)
            }
            else {
                failure(response.error!)
            }
        }
    }
    
}



















