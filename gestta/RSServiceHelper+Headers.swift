//
//  RSServiceHelper+Headers.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import Alamofire
import RSStarterKit

extension RSServiceHelper {
    
    static var authenticatedHeaders: HTTPHeaders {
        var headers = [String: String]()
        headers["Authorization"] = LoginManager.accessToken
                
        return headers
    }
    
}
