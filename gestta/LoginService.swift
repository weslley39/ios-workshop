//
//  LoginService.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RSStarterKit

class LoginService: LoginServiceProtocol {
    
    // MARK: - Endpoints
    enum Services: String, RSServiceEndpoint {
        case login = "core/login"
    }
    
    func performLogin(email: String, password: String, callback: @escaping (RSServiceResponse<String>) -> Void) {
        let uri = RSServiceHelper.mountUrl(withEndPoint: Services.login)
        
        let parameters = ["email": email,
                          "password": password]
        
        RSServiceHelper.restManager().request(uri, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: [RSHttpStatusCode.success.code])
            .responseString(completionHandler: { (response) in
                if response.result.isSuccess, let token = response.response?.allHeaderFields["Authorization"] as! String? {
                    callback(RSServiceResponse(withData: token))
                }
                else {
                    callback(RSServiceResponse(withError: RSServiceError.requestFailure))
                }
            })
    }
    
}
