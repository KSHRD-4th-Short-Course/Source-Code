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
        
    }
    
    func updateArticle(with id: String, paramaters: [String: Any]) {
        
    }
    
    func deleteArticle(with id: String, completion: @escaping (Error?) -> ()) {
        
    }
    
    func uploadFile(file : Data, completion: @escaping (String?, Error?) -> ()) {
        
    }
}
