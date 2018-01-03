//
//  ArticleService.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 12/15/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ArticleServiceDelegate {
    func didRecievedArticle(with articles: [Article]?, pagination: Pagination?, error: Error?)
    
    func didAddedArticle(error: Error?)
    func didUpdatedArticle(error: Error?)
}

extension ArticleServiceDelegate {
    func didRecievedArticle(with articles: [Article]?, pagination: Pagination?, error: Error?) {}
    
    func didAddedArticle(error: Error?) {}
    func didUpdatedArticle(error: Error?) {}
}



class ArticleService {
    
    var delegate: ArticleServiceDelegate?
    
    // Get article by page number and limit
    func getData(pageNumber: Int) {
        Alamofire.request(DataManager.URL.ARTICLE,
                          method: .get,
                          parameters: ["page":pageNumber, "limit":15],
                          encoding: URLEncoding.default, // JSONEncoding.default
            headers: nil)
            .responseJSON { (response) in
                print("Response")
                switch response.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    
                    guard let code = json["code"].int, code == 2222 else {
                        // Report any error
                        let dictionary = [NSLocalizedDescriptionKey: json["message"].string ?? "unknown"]
                        let host = response.request?.url?.host ?? "unknown"
                        let error = NSError(domain: host, code: 9999, userInfo: dictionary)
                        self.delegate?.didRecievedArticle(with: nil, pagination: nil, error: error)
                        return
                    }
                    
                    // get pagination value
                    let pagination = Pagination(json["pagination"])
                    
//                    let articlesJson = json["data"].arrayValue
//                    var articles: [Article] = []
//                    for arr in articlesJson {
//                        articles.append(Article(arr))
//                    }
                    
                    let articles =  json["data"].arrayValue.map{ Article($0) }
                    
                    self.delegate?.didRecievedArticle(with: articles, pagination: pagination, error: nil)
                    
                    
                case .failure(let error):
                    self.delegate?.didRecievedArticle(with: nil, pagination: nil, error: error)
                }
        }
    }
    
    func getArticle(by id: String) {
        
    }
    
    func addArticle(paramaters: [String: Any]) {
        Alamofire.request(DataManager.URL.ARTICLE,
                          method: .post,
                          parameters: paramaters,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let code = json["code"].int, code == 2222 else {
                        // Report any error we got.
                        let dict =  [NSLocalizedDescriptionKey : json["message"].string ?? "unknown"]
                        let error = NSError(domain: response.request?.url?.host ?? "unknown", code: 9999, userInfo: dict)
                       // Error
                        self.delegate?.didAddedArticle(error: error)
                        
                        return
                    }
                    // Success
                    self.delegate?.didAddedArticle(error: nil)
                    
                case .failure(let error):
                    self.delegate?.didAddedArticle(error: error)
                }
        }
    }
    
    func updateArticle(with id: String, paramaters: [String: Any]) {
        Alamofire.request("\(DataManager.URL.ARTICLE)/\(id)",
                          method: .put,
                          parameters: paramaters,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let code = json["code"].int, code == 2222 else {
                        // Report any error we got.
                        let dict =  [NSLocalizedDescriptionKey : json["message"].string ?? "unknown"]
                        let error = NSError(domain: response.request?.url?.host ?? "unknown", code: 9999, userInfo: dict)
                        // Error
                        self.delegate?.didUpdatedArticle(error: error)
                        
                        return
                    }
                    // Success
                    self.delegate?.didUpdatedArticle(error: nil)
                    
                case .failure(let error):
                    self.delegate?.didUpdatedArticle(error: error)
                }
        }
    }
    
    func deleteArticle(with id: String, completion: @escaping (Error?) -> ()) {
        Alamofire.request("\(DataManager.URL.ARTICLE)/\(id)",
            method: .delete,
            headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let code = json["code"].int, code == 2222 else {
                        // Report any error we got.
                        let dict =  [NSLocalizedDescriptionKey : json["message"].string ?? "unknown"]
                        let error = NSError(domain: response.request?.url?.host ?? "unknown", code: 9999, userInfo: dict)
                        // Error
                        completion(error)
                        
                        return
                    }
                    // Success
                    completion(nil)
                    
                case .failure(let error):
                    completion(error)
                }
        }
    }
    
    func uploadFile(file : Data, completion: @escaping (String?, Error?) -> ()) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            multipartFormData.append(file, withName: "file", fileName: ".jpg", mimeType: "image/jpeg") // append image
            
        }, to: DataManager.URL.FILE,
           method: .post,
           headers: nil,
           encodingCompletion: { (encodingResult) in
            switch encodingResult {
               
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        guard let code = json["code"].int, code == 2222 else {
                            // Report any error we got.
                            let dict =  [NSLocalizedDescriptionKey : json["message"].string ?? "unknown"]
                            let error = NSError(domain: response.request?.url?.host ?? "unknown", code: 9999, userInfo: dict)
                            completion(nil, error)
                            return
                        }
                        
                        guard let url = json["data"].string else {
                            // Report any error we got.
                            let dict =  [NSLocalizedDescriptionKey : json["message"].string ?? "unknown"]
                            let error = NSError(domain: response.request?.url?.host ?? "unknown", code: 9999, userInfo: dict)
                            completion(nil, error)
                            return
                        }
                        
                        completion(url, nil)
                    }
                }
            case .failure(let error):
                completion(nil, error)
            }
        })
    }
}











