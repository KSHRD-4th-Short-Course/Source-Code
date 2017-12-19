//
//  ViewController.swift
//  URLSessionDemo
//
//  Created by KSHRD on 12/18/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "http://fakerestapi.azurewebsites.net/api/Books"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
      
            // check error have occur
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            
            let arrayBook = json as? [[String: Any]]
            print(arrayBook?.count)
        }
        
        task.resume()
    }

}









