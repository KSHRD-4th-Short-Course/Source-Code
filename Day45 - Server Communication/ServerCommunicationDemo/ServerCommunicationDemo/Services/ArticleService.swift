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

class ArticleService {
    
    // Get article by page number and limit
    func getData(pageNumber: Int) {
        Alamofire.request(DataManager.URL.ARTICLE,
                          method: .get,
                          parameters: ["page":pageNumber, "limit":15],
                          encoding: URLEncoding.default, // JSONEncoding.default
                          headers: nil)
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error.localizedDescription)
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
