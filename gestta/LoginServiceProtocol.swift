//
//  LoginServiceProtocol.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

protocol LoginServiceProtocol {
    
    func performLogin(email: String, password: String, callback: @escaping (RSServiceResponse<String>) -> Void)
    
}
