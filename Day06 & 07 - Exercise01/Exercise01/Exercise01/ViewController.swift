//
//  ViewController.swift
//  Exercise01
//
//  Created by KSHRD on 10/17/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // TextField
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var phonePrefixTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    // Label
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    // View
    @IBOutlet weak var infoContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    let attributeColor = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    emailTextField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: attributeColor)
        
    fullnameTextField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: attributeColor)
        
    phonePrefixTextField.attributedPlaceholder = NSAttributedString(string: "+855", attributes: attributeColor)
        
    phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "12345678", attributes: attributeColor)
        
        
        infoContainerView.alpha = 0
    }
    
    @IBAction func showInfo(_ sender: Any) {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: .curveLinear,
                       animations: {
            self.infoContainerView.alpha = 1
        }, completion: nil)
        
        if (emailTextField.text?.isEmpty)!  == false {
            emailLabel.text = emailTextField.text
        }
        if (fullnameTextField.text?.isEmpty)!  == false {
            fullnameLabel.text = fullnameTextField.text
        }
        if (phonePrefixTextField.text?.isEmpty)! == false && (phoneNumberTextField.text?.isEmpty)!  == false {
            phoneLabel.text = phonePrefixTextField.text! + " " + phoneNumberTextField.text!
        }
        
       
    }
}







