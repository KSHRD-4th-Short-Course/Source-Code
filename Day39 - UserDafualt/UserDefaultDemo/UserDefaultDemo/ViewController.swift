//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by KSHRD on 12/13/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    @IBAction func openAction(_ sender: Any) {
        
        if (nameTextField.text?.count)! > 0 {
            UserDefaults.standard.set(nameTextField.text!, forKey: "CustomerName")
        }
        
        
        performSegue(withIdentifier: "showGreen", sender: nil)
    }
    
}






