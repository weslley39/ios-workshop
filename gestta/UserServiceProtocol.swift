//
//  UserServiceProtocol.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

protocol UserServiceProtocol {
    
    func me(callback: @escaping (RSServiceResponse<User>) -> Void)
    
}
