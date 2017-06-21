//
//  StringIdentifiers.swift
//  starter-kit
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import RSStarterKit

enum StringIdentifier: String, RSCustomIdentifier {
    
    case empty
    
    //Login
    case loginLabelUser
    case loginHintUser
    case loginLabelPassword
    case loginHintPassword
    case loginbButtonEnter

}

extension StringIdentifier {
    
    func getString() -> String {
        return String(withCustomIdentifier: self)
    }
    
}
