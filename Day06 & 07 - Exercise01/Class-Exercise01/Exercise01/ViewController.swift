//
//  ViewController.swift
//  Exercise01
//
//  Created by Kokpheng on 10/13/17.
//  Copyright © 2017 kshrd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phonePrefixTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = [NSAttributedStringKey.foregroundColor: UIColor.white]
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: color)
        fullNameTextField.attributedPlaceholder = NSAttributedString(string: "Full name", attributes: color)
        phonePrefixTextField.attributedPlaceholder = NSAttributedString(string: "+855", attributes: color)
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "12345678", attributes: color)
        containerView.layer.cornerRadius = 5
    }

    @IBAction func showInfo(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.containerView.alpha = 1.0
        }, completion: nil)
        
        emailLabel.text = emailTextField.text
        fullNameLabel.text = fullNameTextField.text
        phoneLabel.text = "\(phonePrefixTextField.text ?? "") \(phoneNumberTextField.text ?? "") "
    }
}

