//
//  SignUpTableViewController.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/16/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import SCLAlertView

class SignUpTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Property
    let imagePicker = UIImagePickerController()
    
    // Outlet
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: [UITextField]!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set delegate for imagePicker
        imagePicker.delegate = self
    }
    
    // TODO: SignIn IBAction
    @IBAction func signUpAction(_ sender: Any) {
       // Validation Password field
        if passwordTextField[0].text != passwordTextField[1].text {
            SCLAlertView().showError("Error", subTitle: "Password not match")
            return
        }
        
        // Post parameter
        let paramaters = ["email": self.emailTextField.text!,
                          "name": self.nameTextField.text!,
                          "password": self.passwordTextField[0].text!,
                          "gender": self.genderSegmentedControl.selectedSegmentIndex == 0 ? "M" : "F"]
        
        // image
        let photo = ["photo": UIImageJPEGRepresentation(self.profileImageView.image!, 1)!]
        
        UserService.shared.singup(paramaters: paramaters, files: photo) { (response, error) in
            
        }
        
        
    }
    
    // TODO: Browse Image
    @IBAction func browseImage(_ sender: Any) {
        // coonfig property
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        // show image picker
        present(imagePicker, animated: true, completion: nil)
    }
    
    // TODO: Finish Picking Media
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        // Get image
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            // config property and assign image
            self.profileImageView.contentMode = .scaleAspectFit
            self.profileImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // TODO: Image Picker Controller Did Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
