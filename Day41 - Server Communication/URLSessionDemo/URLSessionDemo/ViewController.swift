//
//  ViewController.swift
//  URLSessionDemo
//
//  Created by KSHRD on 12/15/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // Create URL
        let url = URL(string: "https://static.pexels.com/photos/443446/pexels-photo-443446.jpeg")
        
        // Create request url
        let urlRequest = URLRequest(url: url!)
//        urlRequest.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)
//        urlRequest.httpMethod = "POST"
        
        // Create url session
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        let downloadTask = session.downloadTask(with: urlRequest)
        downloadTask.resume()
        self.indicatorView.hidesWhenStopped = true
        self.indicatorView.startAnimating()
  
    }
}

// MARK: - URLSessionDelegate, URLSessionDownloadDelegate
extension ViewController: URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
        
        let data = try! Data(contentsOf: location)
        
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
            self.progressView.isHidden = true
            self.imageView.image = UIImage(data: data)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("\(Float(bytesWritten)) - \(Float(totalBytesWritten)) -  \(Float(totalBytesExpectedToWrite))")
        // Calculate process
        let process = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        DispatchQueue.main.sync {
            self.progressView.progress = process
        }
    }
}





