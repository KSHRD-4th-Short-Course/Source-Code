//
//  SecondViewController.swift
//  UITextFieldDemo
//
//  Created by KSHRD on 10/26/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var valueHolder = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = valueHolder
    }
    
    
}
