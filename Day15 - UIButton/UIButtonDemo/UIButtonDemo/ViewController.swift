//
//  ViewController.swift
//  UIButtonDemo
//
//  Created by KSHRD on 11/1/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSystemButton()

       
    }
    
    fileprivate func setupSystemButton() {
        let button = RoundedButton(frame: CGRect(x: 16, y: 20, width: 100, height: 50))

        view.addSubview(button)
       
        // Add action
        button.addTarget(self, action: #selector(userTap), for: .touchUpInside)
        button.addTarget(self, action: #selector(userTouchDown), for: .touchDown)
        
        
        
        let button2 = RoundedButton(frame: CGRect(x: 120, y: 20, width: 100, height: 50))
        
        view.addSubview(button2)
    }

    @objc func userTap()  {
        print(#function)
    }
    
    @objc func userTouchDown()  {
        print(#function)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(name)
        setupSystemButton()
    }
}





