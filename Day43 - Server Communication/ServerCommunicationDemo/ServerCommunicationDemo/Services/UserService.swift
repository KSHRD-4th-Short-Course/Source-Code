//
//  UserService.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 12/15/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import Foundation
import Alamofire

class UserService {
    
    private init() {} // Prevent from init object
    
    static let shared: UserService = UserService() // Create Singleton instance
    
    func singup(paramaters: [String: String], files: [String:Data], completion: @escaping (DataResponse<Any>?, Error?)->()) {
        
    }
    
    func signin(paramaters: [String: Any], completion: @escaping (DataResponse<Any>?, Error?)->()) {
        
        // Request to server
        Alamofire.request(DataManager.URL.AUTH,
                          method: .post,
                          parameters: paramaters,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response) in // response from server
                // check success or failure
                switch response.result {
                case .success:
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error)
                }
        }
        
    }
}






