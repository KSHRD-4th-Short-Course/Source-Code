//
//  LoginViewController.swift
//  UITextFieldCodeDemo
//
//  Created by KSHRD on 10/27/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //@IBOutlet weak var textField: UITextField!
    // 1.
    var nameTextField: UITextField = UITextField() // Outlet
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Change view's background color
        view.backgroundColor = .lightGray
        
        let nameLabel = UILabel()
        nameLabel.text = "#####"
        nameLabel.sizeToFit()
        
        // Create TextField
        // 2. require Size(0, 0) position (0,0)
        nameTextField.frame = CGRect(x: 16, y: 50, width: 343, height: 30)
       
        // 3. Add more properties to textfield
        nameTextField.backgroundColor = .white
        nameTextField.placeholder = "Username"
        nameTextField.borderStyle = UITextBorderStyle.roundedRect
        nameTextField.returnKeyType = .next
        nameTextField.textAlignment = .left
        nameTextField.keyboardType = .numberPad
        
        nameTextField.delegate = self
        
        nameTextField.leftView = nameLabel
        nameTextField.leftViewMode = .always
        
        
        nameTextField.addTarget(self, action: #selector(editingChange), for: UIControlEvents.editingChanged)
        
        
        // 4. Add textField to view
        view.addSubview(nameTextField)
    }
    
    @objc func editingChange(_ sender: UITextField) {
        print(sender.text)
    }
    
//    @IBAction func didChange(_ sender: UITextField) {
//        
//    }
//    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       // print(textField.text)
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
