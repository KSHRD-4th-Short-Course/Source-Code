//
//  UIImageViewExtension.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/27/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImageWith(urlString: String) {
        // Remove image
        self.image = nil
        
        // Read image from cache
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
            
        }
        // Run background process
        DispatchQueue.global(qos: .background).async {
            do {
                let url = URL(string: urlString)
                let imageData = try Data.init(contentsOf: url!)
                // Return to UI process
                DispatchQueue.main.sync {
                    let imageToCache = UIImage(data: imageData)
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    self.image = imageToCache
                }
            } catch  {
                print("download image error")
            }
        }
    }
    
    func loadImageUsingUrlString(urlString: String) {
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            DispatchQueue.main.sync {
                
                let imageToCache = UIImage(data: data!)
                
                self.image = imageToCache
                
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
            
        }).resume()
    }
    
}

