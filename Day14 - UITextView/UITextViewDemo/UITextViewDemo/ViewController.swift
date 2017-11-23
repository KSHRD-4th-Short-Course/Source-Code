//
//  ViewController.swift
//  UITextViewDemo
//
//  Created by KSHRD on 10/31/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // 1. Create outlet
    let infoTextView: UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(userTap))
        view.addGestureRecognizer(tap)
        
        setupTextView()
    }
    
    // MARK: Setup controls
    func setupTextView() {
        
        // Write your code
        // 2. Set size and position
        let position = CGPoint(x: 0, y: 44)
        let size = CGSize(width: 375, height: 200)
        infoTextView.frame = CGRect(origin: position, size: size)
      
        
        // CGRect(x: 0, y: 20, width: 300, height: 500)
        infoTextView.text = "This is text in textView"
        
        
        // Set delegate
        infoTextView.delegate = self
        
        // 2. Add to view
        view.addSubview(infoTextView)
    }
    
    
    
    // MARK: UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("\(#line) - \(#function)")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    @objc func userTap()  {
        infoTextView.resignFirstResponder()
    }
    
}








