//
//  ViewController.swift
//  UIAlertControllerDemo
//
//  Created by KSHRD on 12/4/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Properties
    weak var secureTextAction: UIAlertAction!
    weak var refUsernameTextField: UITextField!
    weak var refPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(_ sender: Any) {
        alertWithTextField()
    }
    
    func simpleAlert() {
        // Title
        let title = "Welcome"
        
        // Message
        let message = "This is alert message!"
        
        // Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Alert button
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK button pressed!")
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel button pressed!")
        }
        
        let other = UIAlertAction(title: "Other", style: .destructive) { _ in
            print("Other button pressed!")
        }
        
        // Add button to controller
        alertController.addAction(okButton)
        alertController.addAction(cancel)
        alertController.addAction(other)
        
        // Present Alert Controller
        present(alertController, animated: true, completion: nil)
    }
    

    func alertWithTextField() {
        // Title
        let title = "Welcome"
        
        // Message
        let message = "This is alert message!"
        
        // Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Add textfield
        alertController.addTextField { (usernameTextField) in
            
             NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldTextDidChangeNotification), name: NSNotification.Name.UITextFieldTextDidChange, object: usernameTextField)
            usernameTextField.placeholder = "Username"
            self.refUsernameTextField = usernameTextField
        }
        
        alertController.addTextField { (passwordTextField) in
            
            // Add observer to UITextFieldTextDidChange
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldTextDidChangeNotification), name: NSNotification.Name.UITextFieldTextDidChange, object: passwordTextField)
            
            passwordTextField.placeholder = "Password"
            passwordTextField.isSecureTextEntry = true
            self.refPasswordTextField = passwordTextField
        }
        
        
        let removeTextFieldObserver: () -> Void = {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: alertController.textFields!.first)
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: alertController.textFields!.last)
        }

        
        // Alert button
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK button pressed!")
            let username = alertController.textFields?[0].text
            let password = alertController.textFields?.last?.text
            print("\(username) and \(password)")
            removeTextFieldObserver()
        }
        
        okButton.isEnabled = false
        secureTextAction = okButton
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel button pressed!")
            removeTextFieldObserver()
        }
        
        // Add button to controller
        alertController.addAction(okButton)
        alertController.addAction(cancel)
        
        // Present Alert Controller
        present(alertController, animated: true, completion: nil)
    }
    
   
    
    @objc func handleTextFieldTextDidChangeNotification(notification: Notification) {
       
        // Sender object
        //let textField = notification.object as? UITextField
        
        if (refUsernameTextField.text?.isEmpty)! || (refPasswordTextField.text?.isEmpty)! {
            secureTextAction.isEnabled = false
            return
        }
        
        if refUsernameTextField.text!.count <= 5 || refPasswordTextField.text!.count <= 5 {
            secureTextAction.isEnabled = false
            return
        }
        
        secureTextAction.isEnabled = true
    }
    

}












