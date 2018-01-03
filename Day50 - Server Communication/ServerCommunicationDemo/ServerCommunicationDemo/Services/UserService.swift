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
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            // Append paramater string
            for (key, value) in paramaters {
                multipartFormData.append(value.data(using: .utf8, allowLossyConversion: false)!, withName: key)
            }
            
            // Append paramater file
            for (key, value) in files {
                multipartFormData.append(value, withName: key, fileName: ".jpg", mimeType: "image/jpeg")
            }
            
        }, to: DataManager.URL.USER, method: .post, headers: DataManager.HEADER) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                    upload.responseJSON(completionHandler: { (response) in
                        completion(response, nil)
                    })
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func signin(paramaters: [String: Any], completion: @escaping (DataResponse<Any>?, Error?)->()) {
        
        // Request to server
        Alamofire.request(DataManager.URL.AUTH,
                          method: .post,
                          parameters: paramaters,
                          encoding: JSONEncoding.default,
                          headers: DataManager.HEADER)
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
    
    // Step 3: request with Alamofire
    func signinWithFacebook(paramaters: [String: Any], completion: @escaping (DataResponse<Any>?, Error?)->()) {
        
        // Request to server
        Alamofire.request(DataManager.URL.AUTH_WITH_FACEBOOK,
                          method: .post,
                          parameters: paramaters,
                          encoding: JSONEncoding.default,
                          headers: DataManager.HEADER)
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






