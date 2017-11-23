//
//  ViewController.swift
//  UIImageAndImageViewDemo
//
//  Created by KSHRD on 11/13/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loadImageFromInternet()
    }
    
    func loadImageFromInternet() {
        let imageView = UIImageView()
        // Set property
        imageView.frame = CGRect(x: 20, y: 20, width: 300, height: 500)
        imageView.contentMode = .scaleAspectFit
        
        // Create URL
        let url =  URL(string: "http://www.gadgetworld254.com/wp-content/uploads/2017/07/iPhone_SE_19.jpg")
        
        // Do catch block to prevent error
        do {
            let imageData = try Data(contentsOf: url!) // Create data from url
            let image = UIImage(data: imageData) // Create image from data
            imageView.image = image // Set image to imageView
        } catch  {
            print("Image not found") // If try fail, catch block will execute
        }
        
        self.view.addSubview(imageView)
    }
    
    func addImageWithAnimation() {
        // create animate image
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 20, width: 300, height: 500)
        imageView.animationImages = [UIImage(named: "iphonex2")!, #imageLiteral(resourceName: "iphonex1")]
        imageView.contentMode = .scaleAspectFit
        imageView.animationDuration = 3
        imageView.animationRepeatCount = 2
        imageView.startAnimating()
        view.addSubview(imageView)
    }

}







