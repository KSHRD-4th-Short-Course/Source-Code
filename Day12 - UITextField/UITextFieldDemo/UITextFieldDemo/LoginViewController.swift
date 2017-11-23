//
//  ViewController.swift
//  UITextFieldDemo
//
//  Created by KSHRD on 10/25/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ageTextField.returnKeyType = .done
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("\(#line) - \(#function)")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       print("\(#line) - \(#function)")
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("\(#line) - \(#function)")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(#line) - \(#function)")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("\(#line) - \(#function)")
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("\(#line) - \(#function)")
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("\(#line) - \(#function)")
        return true
    }
    
    @IBAction func textFieldValueChange(_ sender: UITextField) {
        ageTextField.text =  sender.text
    }
    
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        ageTextField.text = sender.text
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(#line) - \(#function)")
        
        if textField == nameTextField {
            
            ageTextField.becomeFirstResponder()
            
        }else if textField == ageTextField {
            ageTextField.resignFirstResponder()
            if nameTextField.text == "Admin" && ageTextField.text == "123" {
                performSegue(withIdentifier: "showSecondView", sender: nameTextField.text)
            }
            // execute your code (login function)
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondView" {
            let secondVC = segue.destination as! SecondViewController
            let textValue = sender as! String
            print("\(#line) - \(textValue)")
            secondVC.valueHolder = textValue
        }
    }
}






