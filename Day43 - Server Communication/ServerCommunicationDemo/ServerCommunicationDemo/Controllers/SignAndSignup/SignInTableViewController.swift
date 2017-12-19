//
//  SignInTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/10/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import SwiftyJSON
import SCLAlertView

class SignInTableViewController: UITableViewController {
    
    // Outlet
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.string(forKey: "UserID") != nil) {
            // Open main screen
            // Create storybaord by name
            let storybaord = UIStoryboard(name: "Main", bundle: nil)
            
            // create veiw controller object by InitialViewController
            //let vc = storybaord.instantiateInitialViewController()
            
            // create veiw controller object by identifier
            let vc = storybaord.instantiateViewController(withIdentifier: "RootStorybaordID")
            
            // open screen
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    // TODO: SignIn IBAction
    @IBAction func signInAction(_ sender: Any) {
        
        // Validate textfield
        
        // request param
        let paramaters = [
            "email": emailTextField.text!,
            "password": passwordTextField.text!
        ]
        
        // Sign in
        UserService.shared.signin(paramaters: paramaters) { (response, error) in
            // Check error from server
            if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
            
            // check response from server
            if let value = response?.result.value {
                let json = JSON(value) // Convert to SwiftyJSON
                // Check server code
                if let code = json["code"].int, code == 2222, let id = json["data"]["id"].int {
                    UserDefaults.standard.set("\(id)", forKey: "UserID")
                }else { // error
                    SCLAlertView().showError("Error \(String(describing: json["code"].int))", subTitle: json["message"].stringValue); return
                }
            }else { // error
                SCLAlertView().showError("Error", subTitle: "Server error"); return
            }
            
            // Open main screen
            // Create storybaord by name
            let storybaord = UIStoryboard(name: "Main", bundle: nil)
            
            // create veiw controller object by InitialViewController
            //let vc = storybaord.instantiateInitialViewController()
            
            // create veiw controller object by identifier
            let vc = storybaord.instantiateViewController(withIdentifier: "RootStorybaordID")
            
            // open screen
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
    }
    
    // MARK: - Login with Facebook
    @IBAction func loginWithFacebook(_ sender: Any) {
    
    }
}





