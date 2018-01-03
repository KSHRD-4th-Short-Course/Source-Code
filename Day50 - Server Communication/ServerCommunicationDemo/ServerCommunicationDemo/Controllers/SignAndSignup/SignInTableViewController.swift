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
import FBSDKLoginKit
import NVActivityIndicatorView

class SignInTableViewController: UITableViewController {
    
    // Outlet
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.string(forKey: "UserID") != nil) {
            self.showMainScreen(animation: false)
        }
    }
    
    
    // TODO: SignIn IBAction
    @IBAction func signInAction(_ sender: Any) {
        // Show loading
        let activityData = ActivityData(message: "Loading", type: NVActivityIndicatorType.circleStrokeSpin)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    
        
        // Validate textfield
        
        // request param
        let paramaters = [
            "email": emailTextField.text!,
            "password": passwordTextField.text!
        ]
        
        // Sign in
        UserService.shared.signin(paramaters: paramaters) { (response, error) in
            // Close loading
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            
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
            
            self.showMainScreen(animation: true)
            
        }
        
        
    }
    
    // MARK: - Login with Facebook
    @IBAction func loginWithFacebook(_ sender: Any) {
    
        // Init Facebook SDK Manager
        let manager = FBSDKLoginManager()
        let parameters = ["email", "public_profile"]
        
        // Request login
        manager.logIn(withReadPermissions: parameters, from: self) { (result, error) in
            // Check error from server
            if let err = error { SCLAlertView().showError("Error", subTitle: err.localizedDescription); return }
            
            if (result?.isCancelled)! {
                print("Facebook Login Cancelled!")
            }else {
                // Logged in
                if (result?.grantedPermissions.contains("email"))! {
                    if let token = FBSDKAccessToken.current() {
                        self.fetchFacebookProfile()
                    }
                }else {
                    SCLAlertView().showError("Error", subTitle: "No email")
                }
            }
        }
    }
    
    // Get facebook user profile
    func fetchFacebookProfile() {
        
        // Show loading
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        // Create facebook graph with field
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, gender, email, picture.type(large)"]).start { (connection, result, error) in
            
            // Check error from server
            if let err = error {
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                
                SCLAlertView().showError("Error", subTitle: err.localizedDescription);
                return
                
            }
            
            // *** Request to AMS Facebook API Code ***
            let json = JSON(result!)
            
            // Step 1: create paramaters
            let paramaters = [
                "email": json["email"].stringValue,
                "name": json["name"].stringValue,
                "gender": json["gender"].stringValue == "male" ? "m" : "f",
                "photoUrl": json["picture"]["data"]["url"].stringValue,
                "facebook_id": json["id"].stringValue
            ]
            
            // Step 2 : request to server
            UserService.shared.signinWithFacebook(paramaters: paramaters, completion: { (response, error) in
                
                   NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                
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
                
                self.showMainScreen(animation: true)
                
            })
            
        }
    }
    
    func showMainScreen(animation: Bool) {
        // Open main screen
        // Create storybaord by name
        let storybaord = UIStoryboard(name: "Main", bundle: nil)
        
        // create veiw controller object by InitialViewController
        //let vc = storybaord.instantiateInitialViewController()
        
        // create veiw controller object by identifier
        let vc = storybaord.instantiateViewController(withIdentifier: "RootStorybaordID")
        
        // open screen
        self.present(vc, animated: animation, completion: nil)
    }
}













