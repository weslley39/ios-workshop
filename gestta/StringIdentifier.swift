//
//  StringIdentifiers.swift
//  starter-kit
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

enum StringIdentifier: String, RSCustomIdentifier {
    
    // Login
    case loginLabelUser
    case loginLabelPass
    case loginHintUser
    case loginHintPass
    case loginButtonEnter

}

extension StringIdentifier {
    
    func getString() -> String {
        return String(withCustomIdentifier: self)
    }
    
}
